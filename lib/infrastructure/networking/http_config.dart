import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_index/core/config/env_config.dart';
import 'package:movie_index/infrastructure/networking/interceptors/tmdb_api_auth_interceptor.dart';

const _connectTimeout = Duration(seconds: 5);
const _receiveTimeout = Duration(seconds: 5);

@Singleton(as: Dio)
class HttpConfig with DioMixin implements Dio {
  @override
  BaseOptions get options => BaseOptions(
        baseUrl: EnvConfig.apiBaseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );

  @override
  HttpClientAdapter get httpClientAdapter => IOHttpClientAdapter();

  @override
  Interceptors get interceptors {
    super.interceptors.addAll([const TMDBApiAuthInterceptor()]);

    return super.interceptors;
  }
}
