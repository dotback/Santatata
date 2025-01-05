import 'package:dio/dio.dart';
import 'package:santa_video_generator/core/exceptions/app_exception.dart';

class NetworkException extends AppException {
  final int? statusCode;

  const NetworkException({
    required super.message,
    required super.code,
    this.statusCode,
  });

  factory NetworkException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(
          message: 'サーバーとの接続がタイムアウトしました',
          code: 'NETWORK_CONNECTION_TIMEOUT',
        );
      case DioExceptionType.sendTimeout:
        return const NetworkException(
          message: 'リクエストの送信がタイムアウトしました',
          code: 'NETWORK_SEND_TIMEOUT',
        );
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'サーバーからのレスポンスがタイムアウトしました',
          code: 'NETWORK_RECEIVE_TIMEOUT',
        );
      case DioExceptionType.badResponse:
        return NetworkException(
          message: error.response?.data?['message'] ?? '不明なエラーが発生しました',
          code: 'NETWORK_BAD_RESPONSE',
          statusCode: error.response?.statusCode,
        );
      default:
        return const NetworkException(
          message: '通信エラーが発生しました',
          code: 'NETWORK_ERROR',
        );
    }
  }
}
