# Santa Video Generator

```
# Launch for develop
$ fvm flutter run -d chrome

# Launch for production
$ fvm flutter run -d chrome --dart-define=PRODUCTION=true

# Build
$ fvm flutter build web --wasm
```

依存関係のインストール

```
$ fvm flutter pub get
```

states や models の作成・更新時

```
$ fvm flutter pub run build_runner build
```
