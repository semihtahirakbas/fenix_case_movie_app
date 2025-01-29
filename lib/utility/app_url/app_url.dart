class AppURL {
  static const baseURL = "https://api.themoviedb.org/3";

  static searchURL({required String apiKey, required String query}) =>
      "$baseURL/search/movie?api_key=$apiKey&query=$query";
}
