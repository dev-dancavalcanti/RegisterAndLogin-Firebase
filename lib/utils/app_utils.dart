class API {
  static String requestImage(String image) =>
      'https://image.tmdb.org/t/p/w500/$image';
  static const requestMovieList = 'list/1?page=1';
}
