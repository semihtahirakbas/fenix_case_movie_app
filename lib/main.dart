import 'package:fenix_case_movie_app/core/inject/get_init.dart';
import 'package:fenix_case_movie_app/screens/movie/cubit/movie_cubit_cubit.dart';
import 'package:fenix_case_movie_app/screens/movie/view/movie_view.dart';
import 'package:fenix_case_movie_app/utility/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemeData(),
        home: BlocProvider(
          create: (context) => getIt<MovieCubitCubit>(),
          child: MovieView(),
        ));
  }
}
