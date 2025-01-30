import 'package:fenix_case_movie_app/core/inject/get_init.dart';
import 'package:fenix_case_movie_app/screens/movie/cubit/movie_cubit_cubit.dart';
import 'package:fenix_case_movie_app/screens/movie/view/movie_view.dart';
import 'package:fenix_case_movie_app/utility/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  init();
  runApp(const MyApp());
}

Future<void> init() async {
  configureDependencies();
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
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
