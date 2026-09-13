import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository_provider.g.dart';

// Only readable repository
@Riverpod(keepAlive: true)
MoviesRepository moviesRepository(Ref ref) {
  return MovieRepositoryImp(datasource: MoviedbDatasource());
}
