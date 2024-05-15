import 'package:admin_panel_unsilent/presentation/resources/string_manager.dart';
import 'package:dio/dio.dart';

import '../../app/constants.dart';
import '../model/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handler(dynamic error) {
    if (error is DioException) {
      failure = _handlerDioException(error);
    } else {
      failure = DataResource.defaultResource.getFailure();
    }
  }
}

Failure _handlerDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataResource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataResource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataResource.receiveTimeOut.getFailure();
    case DioExceptionType.cancel:
      return DataResource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataResource.defaultResource.getFailure();
    case DioExceptionType.badCertificate:
      return DataResource.badCertificate.getFailure();
    case DioExceptionType.connectionError:
      return DataResource.connectionError.getFailure();
    case DioExceptionType.badResponse:
      if (error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? Constants.zero,
            error.response?.statusMessage ?? Constants.empty);
      } else {
        return DataResource.defaultResource.getFailure();
      }
  }
}

extension StatusExtension on DataResource {
  Failure getFailure() {
    switch (this) {
      case DataResource.noContent:
        return Failure(DataResourceCode.noContent, DataResourceMessage.noContent);
      case DataResource.badRequest:
        return Failure(DataResourceCode.badRequest, DataResourceMessage.badRequest);
      case DataResource.forBidden:
        return Failure(DataResourceCode.forBidden, DataResourceMessage.forBidden);
      case DataResource.unAuthorised:
        return Failure(DataResourceCode.unAuthorised, DataResourceMessage.unAuthorised);
      case DataResource.notFound:
        return Failure(DataResourceCode.notFound, DataResourceMessage.notFound);
      case DataResource.internalServerError:
        return Failure(DataResourceCode.internalServerError,
            DataResourceMessage.internalServerError);
      case DataResource.connectTimeOut:
        return Failure(
            DataResourceCode.connectTimeOut, DataResourceMessage.connectTimeOut);
      case DataResource.cancel:
        return Failure(DataResourceCode.cancel, DataResourceMessage.cancel);
      case DataResource.receiveTimeOut:
        return Failure(
            DataResourceCode.receiveTimeOut, DataResourceMessage.receiveTimeOut);
      case DataResource.sendTimeOut:
        return Failure(DataResourceCode.sendTimeOut, DataResourceMessage.sentTimeOut);
      case DataResource.cacheError:
        return Failure(DataResourceCode.cacheError, DataResourceMessage.cacheError);
      case DataResource.noInternetConnection:
        return Failure(DataResourceCode.noInternetConnection,
            DataResourceMessage.noInternetConnection);
      case DataResource.defaultResource:
        return Failure(DataResourceCode.defaultResource, DataResourceMessage.defaultResourceMessage);
      case DataResource.connectionError:
        return Failure(DataResourceCode.connectionError, DataResourceMessage.connectionError);
      case DataResource.badCertificate:
        return Failure(DataResourceCode.badCertificate, DataResourceMessage.badCertificate);
    }
  }
}

enum DataResource {
  noContent,
  badRequest,
  forBidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultResource,
  connectionError,
  badCertificate
}

class DataResourceCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorised = 401; // failure, user is not authorised
  static const int forBidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int badCertificate = 501; // failure, not found // todo
  static const int connectionError = 502; // failure, not found// todo


  // local status code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultResource = -7;
}

class DataResourceMessage {

  static const String badRequest = StringManager.badRequestError;
  static const String unAuthorised = StringManager.unauthorizedError;
  static const String forBidden = StringManager.forbiddenError;
  static const String internalServerError = StringManager.internalServerError;
  static const String notFound = StringManager.notFoundError;
  static const String badCertificate = StringManager.notFoundError;
  static const String connectionError =  StringManager.notFoundError;

  // local status code
  static const String connectTimeOut = StringManager.timeoutError;
  static const String cancel = StringManager.defaultError;
  static const String receiveTimeOut = StringManager.timeoutError;
  static const String sentTimeOut = StringManager.timeoutError;
  static const String cacheError = StringManager.cacheError;
  static const String noInternetConnection = StringManager.noInternetError;
  static const String defaultResourceMessage = StringManager.defaultError;
  static const String noContent = StringManager.noContent;
}

class ApiInternalStatus{
  static const String success="success";
  static const int failure=1;
}