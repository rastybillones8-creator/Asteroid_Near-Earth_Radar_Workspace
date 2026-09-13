class AsteroidException implements Exception {
  final String message;
  final Object? cause;

  AsteroidException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'AsteroidException: $message (Underlying: $cause)';
    }
    return 'AsteroidException: $message';
  }
}