import 'dart:developer';
import 'dart:io';

import 'package:clean_architecture_with_bloc/domain/entities/token_data.dart';
import 'package:clean_architecture_with_bloc/domain/repositories/token_repository.dart';
import 'package:dio/dio.dart';

const _baseHeaders = {
  'Content-Type': 'application/json',
  'charset': 'utf-8',
};

class UnauthorizedRequestInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_baseHeaders);
    log('${options.method} >>> ${options.uri}');
    log('Query Parameters: ${options.queryParameters}');
    log('Request Data: ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.requestOptions.method} <<< ${response.requestOptions.uri}');
    log('Response data: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.requestOptions.method} <<< ${err.requestOptions.uri}');
    log('Error data: ${err.response?.data}');

    handler.next(err);
  }
}

class AuthorizedRequestInterceptor extends UnauthorizedRequestInterceptor {
  AuthorizedRequestInterceptor(this._tokenRepository);

  final TokenRepository _tokenRepository;

  TokenData get _token => _tokenRepository.getToken();

  String get bearerToken => 'Bearer ${_token.accessToken}';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      options.headers[HttpHeaders.authorizationHeader] = bearerToken;
      super.onRequest(options, handler);
    } on DioException catch (e) {
      handler.reject(e);
    } on Object catch (e) {
      log(e.toString());
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      // log('Unauthorized request. Refreshing token...');
      // _tokenRepository.refreshToken();
    } else {
      super.onError(err, handler);
    }
  }
}
