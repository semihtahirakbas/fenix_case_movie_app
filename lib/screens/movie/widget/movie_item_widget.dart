import 'package:fenix_case_movie_app/domain/movie/movie_model.dart';
import 'package:fenix_case_movie_app/utility/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({required this.movieModel, super.key});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    const baseImageURL = "https://image.tmdb.org/t/p/w220_and_h330_face";
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Container(
                decoration: const BoxDecoration(color: Colors.orange),
                child: Image.network(
                  "$baseImageURL/${movieModel.posterPath}",
                  fit: BoxFit.fill,
                  width: 200,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movieModel.title,
                style: AppTextStyle.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}
