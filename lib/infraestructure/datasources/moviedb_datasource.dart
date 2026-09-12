import 'package:cinemapedia/config/constants/envieronment_config.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvieronmentConfig.tmdbBaseUrl,
      queryParameters: {
        'api_key': EnvieronmentConfig.tmdbApiKey,
        'language': 'en-US',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final res = await dio.get('/movie/now_playing?page=$page');
    final movieDbResponse = MovieDbResponse.fromJson(res.data);
    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.movieDBToEntity(movieDb))
        .toList();
    return movies;
  }
}
