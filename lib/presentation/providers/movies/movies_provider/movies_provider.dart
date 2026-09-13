import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_list_state/movie_list_state.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_provider.g.dart';

// Declared type for this provider, Could be either async or sync
// @deprecated
// typedef MovieCallback = FutureOr<List<Movie>> Function({required int page});

// Generic Movie Provider
@Riverpod(keepAlive: true)
class MoviesNotifier extends _$MoviesNotifier {
  late final MoviesRepository provider;

  @override
  FutureOr<MovieListState> build() async {
    provider = ref.watch(moviesRepositoryProvider);

    final firstPageMovies = await provider.getNowPlaying(page: 1);

    return MovieListState(
      movies: firstPageMovies,
      page: 1,
      hasReachedMax: firstPageMovies.isEmpty,
    );
  }

  Future<void> loadNextPage() async {
    final currentState = state.value;

    // Prevent invalid state and overloading
    if (currentState == null ||
        currentState.hasReachedMax ||
        currentState.isLoadingMore) {
      return;
    }

    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    final nextPage = currentState.page + 1;

    try {
      final newMovies = await provider.getNowPlaying(page: nextPage);

      state = AsyncData(
        currentState.copyWith(
          movies: [...currentState.movies, ...newMovies],
          page: nextPage,
          hasReachedMax: newMovies.isEmpty,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      // TODO: send error to ui
      state = AsyncData(currentState.copyWith(isLoadingMore: false));
    }
  }
}
