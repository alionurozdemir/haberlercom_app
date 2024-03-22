import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:haberlercom_app/core/model/base_models.dart';
import 'package:haberlercom_app/core/model/request_model.dart';
import 'package:haberlercom_app/core/model/request_response_model.dart';

class NetworkService {
  late final Dio _dio;
  NetworkService() {
    _dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
    ));
    _dio.interceptors.add(CurlLoggerDioInterceptor());
  }

  Future<RequestResponseModel<T>> send<T, R>(RequestModel model) async {
    try {
      final response = await _dio.request<Map<String, dynamic>?>(
          "https://alionurozdemir.com${model.getEndPoint}",
          queryParameters: model.queryParameters,
          data: model.formData ?? model.body,
          options: Options(
            receiveTimeout: const Duration(seconds: 10),
            method: model.type!.name,
          ));
      if (200 <= response.statusCode! && response.statusCode! <= 210) {
        return RequestResponseModel<T>(RequestResponseEnum.success,
            data: model.justDecode!
                ? response.data
                : response.data is List
                    ? (response.data as List)
                        .map<R>((e) => (model.parseModel as BaseModel).fromJson(e))
                        .toList()
                    : (model.parseModel as BaseModel).fromJson(response.data));
      } else {
        log(response.data.toString());
        return RequestResponseModel<T>(RequestResponseEnum.info, error: response.data.toString());
      }
    } on DioException catch (e) {
      return RequestResponseModel(RequestResponseEnum.error, error: "Başarısız");
    } on Exception catch (e) {
      return RequestResponseModel(RequestResponseEnum.error, error: e.toString());
    }
  }
}
