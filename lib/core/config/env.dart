class Env {
  static const isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );
}
