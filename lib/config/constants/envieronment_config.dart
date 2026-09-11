class EnvieronmentConfig {
  // Prevent instantiaton
  EnvieronmentConfig._();

  static const String tmdbApiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue: '',
  );

  static bool get isConfigured {
    return tmdbApiKey.isNotEmpty;
  }
}
