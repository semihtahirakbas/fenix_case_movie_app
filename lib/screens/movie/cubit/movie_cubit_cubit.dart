import 'package:bloc/bloc.dart';
import 'package:fenix_case_movie_app/core/http_statu/http_statu.dart';
import 'package:fenix_case_movie_app/core/inject/get_init.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';
import 'package:fenix_case_movie_app/infrastructure/movie_repo/movie_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_cubit_state.dart';

@injectable
class MovieCubitCubit extends Cubit<MovieCubitState> {
  MovieCubitCubit() : super(MovieInitial());
  final repo = getIt<MovieRepo>();
  void fetchMovies({required String query}) async {
    final either = await repo.getSearchedMovies(query: query);

    either.fold((failure) {
      emit(MovieFetchingFailed(failure: failure as HttpFailure));
    }, (movies) {
      emit(MovieFetched(movies: movies ?? []));
    });
  }
}
