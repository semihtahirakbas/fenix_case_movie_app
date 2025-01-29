import 'package:dartz/dartz.dart';
import 'package:fenix_case_movie_app/core/http_statu/http_statu.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';
import 'package:fenix_case_movie_app/infrastructure/client/dio_client.dart';
import 'package:fenix_case_movie_app/utility/app_url/app_url.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieRepo {
  final client = DioClient();
  Future<Either<HttpStatu, List<MovieModel>?>> getSearchedMovies(
      {required String query}) async {
    try {
      final response = await client.get(AppURL.searchURL(
          apiKey: "ae304e3f4d3830d95075ae6914b55ddf", query: query));
      if (response.statusCode != 200) {
        return left(HttpFailure(failure: "UnexpectedFailure"));
      }
      return right(((response.data)['results'] as List<dynamic>)
          .map((map) => MovieModel.fromMap(map))
          .toList());
    } catch (e) {
      return left(HttpUnexpected());
    }
  }
}
