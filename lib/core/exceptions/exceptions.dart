abstract class AppException implements Exception {}

class GenericException extends AppException {}

class NetworkFileException extends AppException {
  @override
  String toString() {
    return 'Invalid Network File';
  }
}
