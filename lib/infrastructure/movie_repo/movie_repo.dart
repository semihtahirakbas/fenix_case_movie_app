import 'package:dartz/dartz.dart';
import 'package:fenix_case_movie_app/core/http_statu/http_statu.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_result.dart';
import 'package:fenix_case_movie_app/infrastructure/client/dio_client.dart';
import 'package:fenix_case_movie_app/utility/app_url/app_url.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:injectable/injectable.dart';

@injectable
class MovieRepo {
  final client = DioClient();
  Future<Either<HttpStatu, MovieResultModel>> getSearchedMovies(
      {required String query, int? page}) async {
    try {
      final response = await client.get(AppURL.searchURL(
          apiKey: dotenv.get("API_KEY"), query: query, page: page ?? 1));
      if (response.statusCode != 200) {
        return left(HttpFailure(failure: "UnexpectedFailure"));
      }
      return right(MovieResultModel.fromMap(map: response.data));
    } catch (e) {
      return left(HttpFailure(failure: e.toString()));
    }
  }
}
