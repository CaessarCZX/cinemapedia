import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_from_moviedb.dart';

// import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';

class MovieMapper {
  MovieMapper._();
    static const String noBackdropImageFound =
        'https://upload.wikimedia.org/wikipedia/commons/c/c2/No_image_poster.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original';
    // static const String noPosterImageFound =
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi2-wE5rBDTUCA1oMFEAQNGeoVXB7eHYF5z9EH6Cd2Jw&s=10';

  static Movie movieDBToEntity(MovieFromMoviedb movieFromMoviedb) {
    final movieDbImageUrl = 'https://image.tmdb.org/t/p/w500';
    return Movie(
      adult: movieFromMoviedb.adult,
      backdropPath: (movieFromMoviedb.backdropPath != '')
          ? '$movieDbImageUrl${movieFromMoviedb.backdropPath}'
          : noBackdropImageFound,
      genreIds: movieFromMoviedb.genreIds.map((id) => id.toString()).toList(),
      id: movieFromMoviedb.id,
      originalLanguage: movieFromMoviedb.originalLanguage,
      originalTitle: movieFromMoviedb.originalTitle,
      overview: movieFromMoviedb.overview,
      popularity: movieFromMoviedb.popularity,
      posterPath: (movieFromMoviedb.posterPath != '')
          ? '$movieDbImageUrl${movieFromMoviedb.posterPath}'
          : 'no-poster',
      releaseDate: movieFromMoviedb.releaseDate,
      title: movieFromMoviedb.title,
      video: movieFromMoviedb.video,
      voteAverage: movieFromMoviedb.voteAverage,
      voteCount: movieFromMoviedb.voteCount,
    );
  }
}
