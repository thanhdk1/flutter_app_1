part of 'services.dart';
// **************************************************************************
// VietPDb create Service API SafeGate
// **************************************************************************

class _Services implements Services {
  _Services(this._dio, {this.baseUrl}) {
    // if (expiredSession()) {
    //   Get.dialog(AppDialogComp(
    //     content: KeyLanguage.exp_login.tr,
    //     onConfirm: _onConfirm,
    //   ));
    // }
    //  break;
  }

  final Dio _dio;
  String? baseUrl = HttpConstant.BASE_URL;
  String? cdnUrl = HttpConstant.CDN_URL;
  String mockServer = 'http://192.168.1.185:3000';

  RequestOptions _setStreamType<T>(RequestOptions requestOptions,
      {String? token}) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    requestOptions.headers.addAll(HttpConstant.APIS_HEADER);
    // requestOptions.headers
    //     .addAll({'Authorization': token ?? AppConfig().getAuthToken()});
    if (requestOptions.baseUrl == cdnUrl) {
      requestOptions.headers.update("Host", (value) => 'cdn.safegate.vn');
      requestOptions.headers
          .update("Content-Type", (value) => 'multipart/form-data');
    }

    return requestOptions;
  }

  @override
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> login(
      LoginModelRequest loginModelRequest) async {
    final data = <String, dynamic>{};
    data.addAll(loginModelRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<ApiResponse<LoginModelResponse>>>(
        Options(method: 'POST', headers: <String, dynamic>{})
            .compose(_dio.options, '/account/login/phone_number', data: data)
            // .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
            .copyWith(baseUrl: baseUrl)));
    final value = result.data == null
        ? null
        : ApiResponse<LoginModelResponse>.fromJson(
            result.data!, result.statusCode);
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> signup(
      SignUpModelRequest signUpModelRequest) async {
    final data = <String, dynamic>{};
    data.addAll(signUpModelRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ApiResponse<LoginModelResponse>>>(
            Options(method: 'POST', headers: <String, dynamic>{})
                .compose(_dio.options, '/account/register/phone_number',
                    data: data)
                // .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
                .copyWith(baseUrl: baseUrl)));
    final value = result.data == null
        ? null
        : ApiResponse<LoginModelResponse>.fromJson(
            result.data!, result.statusCode);
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> logout(
      String? ownerId, String? token) async {
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ApiResponse<LoginModelResponse>>>(Options(
                method: 'POST',
                headers: <String, dynamic>{"Authorization": token})
            .compose(_dio.options, '/user/$ownerId/logout', data: data)
            // .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
            .copyWith(baseUrl: baseUrl)));
    final value = result.data == null
        ? null
        : ApiResponse<LoginModelResponse>.fromJson(
            result.data!, result.statusCode);
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }
}
