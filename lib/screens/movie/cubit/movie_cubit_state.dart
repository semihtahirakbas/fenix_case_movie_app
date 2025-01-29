part of 'movie_cubit_cubit.dart';

@immutable
sealed class MovieCubitState {}

final class MovieInitial extends MovieCubitState {}

final class MovieFetching extends MovieCubitState {}

final class MovieFetched extends MovieCubitState {
  final List<MovieModel> movies;

  MovieFetched({required this.movies});
}

final class MovieFetchingFailed extends MovieCubitState {
  final HttpFailure failure;

  MovieFetchingFailed({required this.failure});
}
