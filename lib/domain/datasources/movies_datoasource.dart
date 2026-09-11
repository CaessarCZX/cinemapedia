import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatoasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
