// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesNotifier)
final moviesProvider = MoviesNotifierProvider._();

final class MoviesNotifierProvider
    extends $AsyncNotifierProvider<MoviesNotifier, MovieListState> {
  MoviesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesNotifierHash();

  @$internal
  @override
  MoviesNotifier create() => MoviesNotifier();
}

String _$moviesNotifierHash() => r'3e69033bb39c31d18e0bdee410dec073d406ef5b';

abstract class _$MoviesNotifier extends $AsyncNotifier<MovieListState> {
  FutureOr<MovieListState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MovieListState>, MovieListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieListState>, MovieListState>,
              AsyncValue<MovieListState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
