import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  late Dio _dio;
  CancelToken cancelToken = CancelToken();

  ApiService() {
    _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );
    _dio.options.headers.addAll({Headers.acceptHeader: 'application/json'});
  }

  ApiService baseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    return this;
  }

  ApiService addOtherHeader({required Map<String, String> headers}) {
    _dio.options.headers.addAll(headers);
    return this;
  }

  Future<Response> get({
    required String apiPath,
    Map<String, dynamic>? request,
    bool useFormData = true,
    bool isUseCancelToken = true,
  }) async {
    debugPrint('===> CALL API <===');
    debugPrint('URL : ${_dio.options.baseUrl}$apiPath');
    debugPrint('Method : GET');
    debugPrint("Header : ${_dio.options.headers}");
    debugPrint("Request : $request");
    try {
      Response response;
      response = await _dio.get(
        apiPath,
        queryParameters: request,
        cancelToken: isUseCancelToken ? cancelToken : null,
      );
      debugPrint('Success [METHOD GET] $apiPath');
      debugPrint('Success Response : ${response.data}');
      debugPrint('---');
      return response;
    } on DioError catch (e) {
      if (e.response?.data is Map) {
        (e.response?.data as Map).addAll(<String, dynamic>{
          "status": "error",
        });
        debugPrint('Error: [METHOD GET] $apiPath: $e');
        debugPrint('Error: $apiPath: ${e.response?.data}');
        debugPrint('---');
        return e.response!;
      } else {
        Response response = Response(
          data: {
            "code": 0011,
            "message": "error",
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        if (cancelToken.isCancelled) {
          response = Response(
            data: {
              "code": null,
              "message": "request cancelled",
            },
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode,
          );
        }
        debugPrint('Error: [METHOD GET] $apiPath: $e');
        debugPrint('Error: $apiPath: ${response.data}');
        debugPrint('---');
        return response;
      }
    }
  }

  Future<Response> post({
    required String apiPath,
    Map<String, dynamic>? request,
    bool useFormData = false,
  }) async {
    debugPrint('===> CALL API <===');
    debugPrint('URL : ${_dio.options.baseUrl}$apiPath');
    debugPrint('Method : POST');
    debugPrint("Header : ${_dio.options.headers}");
    debugPrint("Request : $request");
    try {
      Response response;
      response = await _dio.post(
        apiPath,
        data: useFormData ? FormData.fromMap(request!) : request,
        cancelToken: cancelToken,
      );
      debugPrint('Success [METHOD POST] $apiPath');
      debugPrint('Success Response : ${response.data}');
      debugPrint('---');
      return response;
    } on DioError catch (e) {
      if (e.response?.data is Map) {
        (e.response?.data as Map).addAll(<String, dynamic>{
          "status": "error",
        });
        debugPrint('Error : [METHOD POST] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return e.response!;
      } else {
        Response response = Response(
          data: {
            "code": 0011,
            "message": "error",
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        if (cancelToken.isCancelled) {
          response = Response(
            data: {
              "code": null,
              "message": "request cancelled",
            },
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode,
          );
        }
        debugPrint('Error : [METHOD POST] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return response;
      }
    }
  }

  Future<Response> postList({
    required String apiPath,
    List<Map<String, dynamic>>? request,
  }) async {
    debugPrint('===> CALL API <===');
    debugPrint('URL : ${_dio.options.baseUrl}$apiPath');
    debugPrint('Method : POST');
    debugPrint("Header : ${_dio.options.headers}");
    debugPrint("Request : $request");
    try {
      Response response;
      response = await _dio.post(
        apiPath,
        data: request,
        cancelToken: cancelToken,
      );
      debugPrint('Success [METHOD POST] $apiPath');
      debugPrint('Success Response : ${response.data}');
      debugPrint('---');
      return response;
    } on DioError catch (e) {
      if (e.response?.data is Map) {
        (e.response?.data as Map).addAll(<String, dynamic>{
          "status": "error",
        });
        debugPrint('Error : [METHOD POST] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return e.response!;
      } else {
        Response response = Response(
          data: {
            "code": 0011,
            "message": "error",
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        if (cancelToken.isCancelled) {
          response = Response(
            data: {
              "code": null,
              "message": "request cancelled",
            },
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode,
          );
        }
        debugPrint('Error : [METHOD POST] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return response;
      }
    }
  }

  Future<Response> put({
    required String apiPath,
    Map<String, dynamic>? request,
    bool useFormData = true,
  }) async {
    debugPrint('===> CALL API <===');
    _dio.options.headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    debugPrint('URL : ${_dio.options.baseUrl}$apiPath');
    debugPrint('Method : PUT');
    debugPrint("Header : ${_dio.options.headers}");
    debugPrint("Request : $request");
    try {
      Response response;
      response = await _dio.put(
        apiPath,
        data: useFormData ? FormData.fromMap(request!) : request,
        cancelToken: cancelToken,
      );
      debugPrint('Success [METHOD PUT] $apiPath');
      debugPrint('Success Response : ${response.data}');
      debugPrint('---');
      return response;
    } on DioError catch (e) {
      if (e.response?.data is Map) {
        (e.response?.data as Map).addAll(<String, dynamic>{
          "status": "error",
        });
        debugPrint('Error: [METHOD PUT] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return e.response!;
      } else {
        Response response = Response(
          data: {
            "code": 0011,
            "message": "error",
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        if (cancelToken.isCancelled) {
          response = Response(
            data: {
              "code": null,
              "message": "request cancelled",
            },
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode,
          );
        }
        debugPrint('Error: [METHOD PUT] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return response;
      }
    }
  }

  Future<Response> delete({
    required String apiPath,
    Map<String, dynamic>? request,
    bool useFormData = false,
  }) async {
    debugPrint('===> CALL API <===');
    debugPrint('URL : ${_dio.options.baseUrl}$apiPath');
    debugPrint('Method : DELETE');
    debugPrint("Header : ${_dio.options.headers}");
    debugPrint("Request : $request");
    try {
      Response response;
      response = await _dio.delete(
        apiPath,
        data: useFormData ? FormData.fromMap(request!) : request,
        cancelToken: cancelToken,
      );
      debugPrint('Success [METHOD DELETE] $apiPath');
      debugPrint('Success Response : ${response.data}');
      debugPrint('---');
      return response;
    } on DioError catch (e) {
      if (e.response?.data is Map) {
        (e.response?.data as Map).addAll(<String, dynamic>{
          "status": "error",
        });
        debugPrint('Error: [METHOD DELETE] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return e.response!;
      } else {
        Response response = Response(
          data: {
            "code": 0011,
            "message": "error",
          },
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode,
        );
        if (cancelToken.isCancelled) {
          response = Response(
            data: {
              "code": null,
              "message": "request cancelled",
            },
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode,
          );
        }
        debugPrint('Error: [METHOD DELETE] $apiPath: $e');
        debugPrint('Error : $apiPath: ${e.response?.data}');
        debugPrint('---');
        return response;
      }
    }
  }
}
