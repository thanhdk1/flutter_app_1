// ignore_for_file: depend_on_referenced_packages

import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/common/core/sys/base_function.dart';
import 'package:pvoil_station/common/core/sys/json_parser.dart';
import 'package:pvoil_station/common/exception/app_exception/handle_app_exception.dart';
import 'package:pvoil_station/common/exception/app_exception/handle_runtime_exception.dart';
import 'package:pvoil_station/common/helper/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

extension FutureExtensions<T> on Future<HttpResponse<ApiResponse<T?>?>> {
  Future<ApiResponse<List<T?>?>> wrap(
      {T Function(dynamic json)? cast, String? keyParser}) async {
    try {
      HttpResponse<ApiResponse<T?>?> httpResponse = await this;

      return await HandleSuccess<T?>(httpResponse, cast: cast)
          .success(keyParser: keyParser);
    } catch (error) {
      showError(error);

      if (error is DioError) return HandleDioException<T>(error).catchError();

      return HandleRuntimeException<T>(error).catchError();
    }
  }

  Future<ApiResponse<T?>> wrapV2({T Function(dynamic json)? cast}) async {
    try {
      HttpResponse<ApiResponse<T?>?> httpResponse = await this;

      return await HandleSuccess<T?>(httpResponse, cast: cast).successV2();
    } catch (error) {
      showError(error);

      if (error is DioError) return HandleDioException<T>(error).catchErrorV2();

      return HandleRuntimeException<T>(error).catchErrorV2();
    }
  }
}

class HandleSuccess<T> {
  HttpResponse<ApiResponse<T?>?> httpResponse;
  T? Function(dynamic json)? cast;

  HandleSuccess(this.httpResponse, {this.cast});

  Future<ApiResponse<List<T?>?>> success({String? keyParser}) {

    String okMessage = 'Thành công';
    int okErrorCode = CodeConstant.OK;

    // if (responseData['code'] != CodeConstant.OK) {
    //   okMessage = responseData['message'] ?? HttpConstant.UNKNOWN;
    //   okErrorCode = responseData['code'] ?? CodeConstant.UNKNOWN;
    // }

    if (cast == null) {
      return Future.value(ApiResponse<List<T?>>(
          err: ErrorCode(okErrorCode, okMessage),
          allData: httpResponse.data?.allData));
    }

    if (httpResponse.data?.allData != null) {
      ApiResponse<List<T?>> result = ApiResponse<List<T?>>(
          err: ErrorCode(okErrorCode, okMessage),
          data: JsonParser()
              .parse<T>(httpResponse.data?.allData, fromJson: cast, keyParser: keyParser));
      return Future.value(result);
    }

    return Future.value(ApiResponse<List<T?>>(
        err: ErrorCode(okErrorCode, okMessage),
        data: httpResponse.data?.allData));
  }

  Future<ApiResponse<T?>> successV2() {
    // final responseData = httpResponse.response.data;

    String okMessage = 'Thành công';
    int okErrorCode = CodeConstant.OK;

    // if (responseData['code'] != CodeConstant.OK) {
    //   okMessage = responseData['message'] ?? HttpConstant.UNKNOWN;
    //   okErrorCode = responseData['code'] ?? CodeConstant.UNKNOWN;
    // }

    if (cast == null) {
      return Future.value(ApiResponse<T?>(
          err: ErrorCode(okErrorCode, okMessage),
          allData: httpResponse.data?.allData));
    }

    if (httpResponse.data?.allData != null) {
      return Future.value(ApiResponse<T>(
          err: ErrorCode(okErrorCode, okMessage),
          data: cast?.call(httpResponse.data?.allData)));
    }

    return Future.value(ApiResponse<T>(
        err: ErrorCode(okErrorCode, okMessage),
        data: httpResponse.data?.allData));
  }
}
