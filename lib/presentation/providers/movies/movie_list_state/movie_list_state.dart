import 'package:cinemapedia/domain/entities/movie.dart';

class MovieListState {
  final List<Movie> movies;
  final int page;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const MovieListState({
    this.movies = const [],
    this.page = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false
  });

  MovieListState copyWith({
    List<Movie>? movies,
    int? page,
    bool? hasReachedMax,
    bool? isLoadingMore
  }) {
    return MovieListState(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore
    );
  }
}
