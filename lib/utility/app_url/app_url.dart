class AppURL {
  static const baseURL = "https://api.themoviedb.org/3";

  static const baseImageURL = "https://image.tmdb.org/t/p/w220_and_h330_face";

  static searchURL(
          {required String apiKey, required String query, int page = 1}) =>
      "$baseURL/search/movie?api_key=$apiKey&query=$query&page=$page";
}
