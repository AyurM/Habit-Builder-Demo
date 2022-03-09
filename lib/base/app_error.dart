const _noConnectionMessage = 'Network error. Check your Internet connection';
const _badGatewayMessage = 'Error 502: Bad Gateway';
const _unauthorizedMessage = 'Authorization error';
const _timeoutMessage = 'Error: connection timeout';
const _tokenErrorMessage = 'Authentication token error';
const _notFoundMessage = 'Error 404: Resource not found';
const _noDataMessage = 'Response has no data';
const _unknownMessage = 'Unknown error';

enum AppErrorType {
  unauthorized,
  tokenError,
  timeout,
  noConnection,
  badGateway,
  notFound,
  noData,
  unknown
}

extension ErrorMessageExtension on AppErrorType {
  String get defaultMessage {
    switch (this) {
      case AppErrorType.noConnection:
        return _noConnectionMessage;
      case AppErrorType.badGateway:
        return _badGatewayMessage;
      case AppErrorType.unauthorized:
        return _unauthorizedMessage;
      case AppErrorType.tokenError:
        return _tokenErrorMessage;
      case AppErrorType.timeout:
        return _timeoutMessage;
      case AppErrorType.notFound:
        return _notFoundMessage;
      case AppErrorType.noData:
        return _noDataMessage;
      case AppErrorType.unknown:
        return _unknownMessage;
    }
  }
}

class AppException implements Exception {
  final AppErrorType type;
  final String? message;

  const AppException(this.type, {this.message});

  @override
  String toString() => message ?? type.defaultMessage;
}
