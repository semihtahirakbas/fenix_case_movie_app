import 'package:fenix_case_movie_app/domain/i_item_model.dart';

class MovieModel extends IItemModel {
  final int id;
  final bool isAdult;
  final List<dynamic> genreIds;
  final String title;
  final String overView;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  MovieModel(this.id, this.isAdult, this.genreIds, this.title, this.overView,
      this.posterPath, this.voteAverage, this.voteCount);

  @override
  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
      map["id"],
      map["adult"],
      map['genre_ids'] ?? [],
      map['title'],
      map['overview'],
      map['poster_path'] ?? "",
      map['vote_average'] ?? -1,
      map['vote_count'] ?? -1);
}
