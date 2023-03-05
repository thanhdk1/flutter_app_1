import 'package:pvoil_station/common/core/model_base/base_use_case.dart';
import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/data/model/login/login_model.dart';
import 'package:pvoil_station/domain/repository/login/login_repository.dart';

class PostLoginPhoneUseCase
    extends BaseUseCase<ApiResponse<LoginModelResponse?>> {
  final LoginRepository repository;
  final LoginModelRequest loginModelRequest;

  PostLoginPhoneUseCase(
      {required this.repository, required this.loginModelRequest});

  @override
  Future<ApiResponse<LoginModelResponse?>> invoke() async {
    ApiResponse<LoginModelResponse?> response =
        await repository.login(loginModelRequest);
    return response;
  }

  @override
  void validate() {}
}
