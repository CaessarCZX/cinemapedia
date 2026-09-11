import 'package:cinemapedia/config/constants/envieronment_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    final apiExposed = EnvieronmentConfig.tmdbApiKey;
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body:Center(child: Text(apiExposed)),
    );
  }
}
