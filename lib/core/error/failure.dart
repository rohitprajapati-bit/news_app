class AppException implements Exception {
  final String? _massage;
  final String? _prefix;
  AppException(this._massage, this._prefix);

  @override
  String toString() {
    if (_massage == null || _massage.isEmpty) {
      return '$_prefix';
    }
    return '$_prefix: $_massage';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? massage])
    : super(massage, 'No Internet Connection');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? massage])
    : super(massage, 'Unauthorized Exception');
}

class TimeoutException extends AppException {
  TimeoutException([String? massage]) : super(massage, 'Timeout Exception');
}

class BadRequestException extends AppException {
  BadRequestException([String? massage])
    : super(massage, 'Bad Request Exception');
}

class FetchDataException extends AppException {
  FetchDataException([String? massage])
    : super(massage, 'Fetch Data Exception');
}
