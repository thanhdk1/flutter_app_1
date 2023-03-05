// ignore_for_file: depend_on_referenced_packages

import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/common/exception/app_exception/validate_exception.dart';
import 'package:pvoil_station/common/helper/constant.dart';
import 'package:collection/collection.dart';

abstract class BaseUseCase<T> {
  BaseUseCase() {
    validate();
  }

  /*
  * Khi thực thi xong một request, [checkNull] nên được gọi
  * để có thể kiểm tra có dữ liệu hay thành công hay không
  * */
  bool isNotOk(ApiResponse? value) {
    return value?.err?.code != CodeConstant.OK;
  }

  void validate();

  Future<T> invoke();

  ApiResponse<E?> getObject<E>(ApiResponse<List<E?>?> response) {
    if (isNotOk(response)) return ApiResponse.error(e: response.err);
    return ApiResponse.success(response.data?.firstOrNull, e: response.err);
  }

  void notNull(dynamic data, {String? name}) {
    if (data == null) {
      throw ValidateException('${name ?? runtimeType} must not null');
    }
  }

  void notEmpty(dynamic data, {String? name}) {
    if (data.isEmpty) {
      throw ValidateException('${name ?? runtimeType} must not empty');
    }
  }

  void notNullOrEmpty(dynamic data, {String? name}) {
    notNull(data, name: name);
    notEmpty(data, name: name);
  }

  Future<bool> isNotConnection() async {
    // try {
    //   final result = await InternetAddress.lookup('google.com');
    //   return !(result.isNotEmpty && result[0].rawAddress.isNotEmpty);
    // } on SocketException catch (_) {
    //   return true;
    // }
    return false;
  }
}
