part of httputils;

class URISyntaxException implements Exception {
  final String message;
  
  const URISyntaxException([String this.message = ""]);
  
  String toString() => message;
}