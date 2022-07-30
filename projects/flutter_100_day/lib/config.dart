class Environment {
  static const isDevelop = String.fromEnvironment('RUN_ENV') == 'develop';
  static const isAlpha = String.fromEnvironment('RUN_ENV') == 'alpha';
  static const isProduction = String.fromEnvironment('RUN_ENV') == 'production';
}
