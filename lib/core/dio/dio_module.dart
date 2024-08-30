import 'package:clean_architecture_with_bloc/core/dio/api_interceptor.dart';
import 'package:clean_architecture_with_bloc/domain/repositories/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _baseUrl = "https://api.themoviedb.org/3";
const _requestTimeOutInSeconds = Duration(seconds: 7);

@module
abstract class DioModule {
  @singleton
  Dio getAuthorizedDioClient(TokenRepository tokenRepository) {
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([AuthorizedRequestInterceptor(tokenRepository)]);
    return dioClient;
  }

  @Named('UnAuthorized')
  @singleton
  Dio getUnAuthorizedDioClient() {
    final dioClient = _dioClient();
    dioClient.interceptors.add(UnauthorizedRequestInterceptor());

    return dioClient;
  }

  Dio _dioClient() {
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: _requestTimeOutInSeconds,
      receiveTimeout: _requestTimeOutInSeconds,
    );

    return Dio(baseOptions);
  }
}
