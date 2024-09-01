import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class TMDBApiAuthInterceptor extends Interceptor {
  const TMDBApiAuthInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: Change getting bearer token approach
    final bearerToken =
        await rootBundle.loadString('assets/.tmdb_bearer_token.txt');

    options.headers.addAll({
      'accept': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    });

    super.onRequest(options, handler);
  }
}
