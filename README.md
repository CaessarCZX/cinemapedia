# cinemapedia app

Small application for movies catalog
## Cinemapedia


## Dev

1. Copy `secrets.template.json` and rename it to `secrets.json`
2. Change the example values with your own credentials (The Movie Database, etc)
3. When running the application in debug mode or building it, add the following line to retrieve the secrets `--dart-define-from-file=secrets.json`
  - I.e debugging app
```Javascript
  flutter run --dart-define-from-file=secrets.json
```
  - I.e building app
```Javascript
  flutter build apk --dart-define-from-file=secrets.json
```

