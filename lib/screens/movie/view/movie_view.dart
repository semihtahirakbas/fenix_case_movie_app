import 'package:fenix_case_movie_app/screens/movie/cubit/movie_cubit_cubit.dart';
import 'package:fenix_case_movie_app/screens/movie/widget/movie_item_widget.dart';
import 'package:fenix_case_movie_app/utility/app_text/app_text.dart';
import 'package:fenix_case_movie_app/utility/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import '../../../utility/widget/searchbar_widget.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  late final TextEditingController controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    controller = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(loadMoreItems);
    super.initState();
  }

  void loadMoreItems() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<MovieCubitCubit>().fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.appName),
      ),
      body: BlocBuilder<MovieCubitCubit, MovieCubitState>(
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
                        controller: _scrollController,
                        primary: false,
                        slivers: <Widget>[
                          state.movies.isNotEmpty
                              ? SliverPadding(
                                  padding: const EdgeInsets.all(20),
                                  sliver: SliverGrid.count(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 4,
                                      children: List.generate(
                                          state.movies.length,
                                          (index) => MovieItemWidget(
                                              movieModel:
                                                  state.movies[index]))),
                                )
                              : SliverToBoxAdapter(
                                  child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: Text(
                                        "Film Bulunamadı",
                                        style: AppTextStyle.appTitle,
                                      )))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
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
                    const Expanded(child: SizedBox()),
                    Text(
                      "Bir hata oluştu tekrar deneyin",
                      style: AppTextStyle.appTitle,
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
