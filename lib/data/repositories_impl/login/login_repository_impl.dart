// ignore_for_file: non_constant_identifier_names

import 'package:pvoil_station/common/core/sys/api_extension.dart';
import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/common/network/client.dart';
import 'package:pvoil_station/data/model/login/login_model.dart';
import 'package:pvoil_station/data/model/login/signup_model.dart';
import 'package:pvoil_station/domain/repository/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl._internal();

  static final LoginRepositoryImpl _impl = LoginRepositoryImpl._internal();

  factory LoginRepositoryImpl() => _impl;

  @override
  Future<ApiResponse<LoginModelResponse?>> login(
      LoginModelRequest loginRQ) async {
    // ignore: todo
    // TODO: implement login

    return await Client()
        .service
        .login(loginRQ)
        .wrapV2(cast: (json) => LoginModelResponse.fromJson(json));
  }

  @override
  Future<ApiResponse<LoginModelResponse?>> signUp(
      SignUpModelRequest signUpPhoneNumber) async {
    // ignore: todo
    // TODO: implement signUp
    return await Client()
        .service
        .signup(signUpPhoneNumber)
        .wrapV2(cast: (json) => LoginModelResponse.fromJson(json));
  }

  @override
  Future<ApiResponse<LoginModelResponse?>> logout(
      String ownerId, String? token) async {
    return await Client()
        .service
        .logout(ownerId, token)
        .wrapV2(cast: (json) => LoginModelResponse.fromJson(json));
  }
}
