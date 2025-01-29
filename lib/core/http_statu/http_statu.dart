abstract class HttpStatu {}

class HttpSuccess<T> extends HttpStatu {
  final T response;

  HttpSuccess({required this.response});
}

class HttpFailure extends HttpStatu {
  final String failure;

  HttpFailure({required this.failure});
}

class HttpUnexpected extends HttpStatu {}
