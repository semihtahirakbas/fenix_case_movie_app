import 'package:bloc/bloc.dart';
import 'package:fenix_case_movie_app/core/http_statu/http_statu.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';
import 'package:meta/meta.dart';

part 'movie_cubit_state.dart';

class MovieCubitCubit extends Cubit<MovieCubitState> {
  MovieCubitCubit() : super(MovieInitial());

  void fetchMovies() {}
}
