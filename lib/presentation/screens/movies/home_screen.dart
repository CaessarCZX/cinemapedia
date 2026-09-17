import 'package:cinemapedia/presentation/providers/movies/movies_provider/movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    // Load movies to app state
    // ref.read(moviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(moviesProvider);

    return Column(
      children: [
        CustomAppbar(),
        Expanded(
          child: nowPlayingMovies.when(
            data: (movieListState) {
              final movies = movieListState.movies;
          
              return ListView.builder(
                itemCount: movies.length + (movieListState.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  // Si llegamos al final y está cargando más, mostramos un spinner abajo
                  if (index == movies.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
          
                  final movie = movies[index];
                  return ListTile(
                    title: Text(movie.title),
                  ); // O tu diseño de película
                },
              );
            },
            // Esto solo se ejecuta la PRIMERA vez que carga la página 1
            loading: () => const Center(child: CircularProgressIndicator()),
            // Esto maneja si la página 1 falla al cargar
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
    );
  }
}
