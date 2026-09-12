class EnvieronmentConfig {
  // Prevent instantiaton
  EnvieronmentConfig._();

  static const String tmdbApiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue: '',
  );

  static const String tmdbBaseUrl = String.fromEnvironment(
    'TMDB_API_BASE_URL',
    defaultValue: 'https://api.themoviedb.org/3',
  );

  static bool get isConfigured {
    return tmdbApiKey.isNotEmpty && tmdbBaseUrl.isNotEmpty
    ;
  }
}
