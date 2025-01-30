part of 'movie_cubit_cubit.dart';

@immutable
sealed class MovieCubitState {}

final class MovieInitial extends MovieCubitState {}

final class MovieFetching extends MovieCubitState {}

final class MovieFetched extends MovieCubitState {
  final List<MovieModel> movies;
  final int totalPage;
  final bool isMoreItemFetching;
  MovieFetched(
      {required this.movies,
      required this.totalPage,
      required this.isMoreItemFetching});

  MovieFetched copyWith(
          {List<MovieModel>? movies,
          int? totalPage,
          bool? isMoreItemFetching}) =>
      MovieFetched(
          movies: movies ?? this.movies,
          totalPage: totalPage ?? this.totalPage,
          isMoreItemFetching: isMoreItemFetching ?? this.isMoreItemFetching);
}

final class MovieFetchingFailed extends MovieCubitState {
  final HttpFailure failure;

  MovieFetchingFailed({required this.failure});
}
