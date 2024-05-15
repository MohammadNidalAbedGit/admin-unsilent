import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../presentation/resources/constants_manager.dart';

class DioFactory{


  Dio getDio(){
    Dio dio =Dio();

    Map<String, String> headers={};

    dio.options=BaseOptions(
      headers: headers,
      baseUrl: baseUrl,
      sendTimeout: const Duration(milliseconds: apiTimeOut) ,
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
    );

    if(!kReleaseMode){
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ));
    }
    return dio;
  }
}