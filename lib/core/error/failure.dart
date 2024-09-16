import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout  with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout  with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout  with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('BadCretificate  with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Requset to ApiServer is Canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error ,Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your Request  was not found, please try Later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a Problem  with Server, please try Later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There Was an Error ,Please Try Later');
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);

  factory NetworkFailure.fromDioError(DioException e) {
    // Handle different network-related Dio errors here
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure('Network timeout, please check your connection');
      case DioExceptionType.connectionError:
        return NetworkFailure('No internet connection, please try again');
      case DioExceptionType.cancel:
        return NetworkFailure('Request was cancelled');
      case DioExceptionType.unknown:
        return NetworkFailure('An unknown network error occurred');
      default:
        return NetworkFailure('A network error occurred, please try again');
    }
  }
}

// class CacheFailure extends Failure {}

// class NetworkFailure extends Failure {}
