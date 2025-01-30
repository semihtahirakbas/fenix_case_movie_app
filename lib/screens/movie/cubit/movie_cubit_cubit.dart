import 'package:bloc/bloc.dart';
import 'package:fenix_case_movie_app/core/http_statu/http_statu.dart';
import 'package:fenix_case_movie_app/core/inject/get_init.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';
import 'package:fenix_case_movie_app/infrastructure/movie_repo/movie_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_cubit_state.dart';

@injectable
class MovieCubitCubit extends Cubit<MovieCubitState> {
  MovieCubitCubit() : super(MovieInitial());

  final repo = getIt<MovieRepo>();
  int page = 1;

  String query = "";

  void fetchMovies({required String query}) async {
    this.query = query;
    final either = await repo.getSearchedMovies(query: query);

    either.fold((failure) {
      emit(MovieFetchingFailed(failure: failure as HttpFailure));
    }, (result) {
      emit(MovieFetched(
          movies: result.movies,
          totalPage: result.totalPage,
          currentPage: page,
          isMoreItemFetching: false));
    });
  }

  void fetchMore() async {
    final totalPage = (state as MovieFetched).totalPage;
    emit((state as MovieFetched).copyWith(isMoreItemFetching: true));
    if (page > totalPage) {
      return;
    }
    page = page + 1;

    final either = await repo.getSearchedMovies(query: query, page: page);

    either.fold((failure) {}, (result) {
      List<MovieModel> addedItems = List.of((state as MovieFetched).movies)
        ..addAll(result.movies);
      debugPrint(addedItems.length.toString());
      emit(
        (state as MovieFetched).copyWith(
            movies: addedItems, isMoreItemFetching: false, currentPage: page),
      );
    });
  }
}
