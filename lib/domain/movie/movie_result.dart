import 'package:fenix_case_movie_app/domain/i_item_model.dart';
import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';

class MovieResultModel extends IItemModel {
  final int totalPage;
  final List<MovieModel> movies;

  MovieResultModel({required this.totalPage, required this.movies});

  factory MovieResultModel.fromMap({required Map<String, dynamic> map}) =>
      MovieResultModel(
          totalPage: map['total_pages'],
          movies: (map['results'] as List<dynamic>)
              .map((map) => MovieModel.fromMap(map))
              .toList());
}
