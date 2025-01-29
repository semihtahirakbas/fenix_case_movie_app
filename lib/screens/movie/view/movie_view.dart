import 'package:fenix_case_movie_app/screens/movie/cubit/movie_cubit_cubit.dart';
import 'package:fenix_case_movie_app/screens/movie/widget/movie_item_widget.dart';
import 'package:fenix_case_movie_app/utility/app_text/app_text.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import '../../../core/inject/get_init.dart';
import '../../../utility/widget/searchbar_widget.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.appName),
      ),
      body: BlocProvider(
        create: (context) => getIt<MovieCubitCubit>(),
        child: BlocBuilder<MovieCubitCubit, MovieCubitState>(
          builder: (context, state) {
            switch (state) {
              case MovieFetching _:
                return const CircularProgressIndicator();
              case MovieInitial _:
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8),
                        child: SearchbarWidget(
                          onSearch: (value) {
                            context
                                .read<MovieCubitCubit>()
                                .fetchMovies(query: value);
                          },
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                );
              case MovieFetchingFailed _:
                return const Text("Failed");
              case MovieFetched _:
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8),
                        child: SearchbarWidget(
                          onSearch: (value) {
                            if (value.length <= 2) {
                              return;
                            }
                            context
                                .read<MovieCubitCubit>()
                                .fetchMovies(query: value);
                          },
                          controller: controller,
                        ),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          primary: false,
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.all(20),
                              sliver: SliverGrid.count(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 4,
                                  children: List.generate(
                                      state.movies.length,
                                      (index) => MovieItemWidget(
                                          movieModel: state.movies[index]))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              default:
                const Center(
                  child: CircularProgressIndicator(),
                );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
