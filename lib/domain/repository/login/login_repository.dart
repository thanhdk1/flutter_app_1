// ignore_for_file: non_constant_identifier_names

import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/data/model/login/login_model.dart';
import 'package:pvoil_station/data/model/login/signup_model.dart';

abstract class LoginRepository {
  Future<ApiResponse<LoginModelResponse?>> login(LoginModelRequest loginRQ);
  Future<ApiResponse<LoginModelResponse?>> signUp(
      SignUpModelRequest signUpPhoneNumber);
  Future<ApiResponse<LoginModelResponse?>> logout(
      String ownerId, String? token);
}
