import 'package:fenix_case_movie_app/screens/movie/view/movie_view.dart';
import 'package:fenix_case_movie_app/utility/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemeData(),
        home: const MovieView());
  }
}
