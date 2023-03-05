import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:dio/dio.dart';
import 'package:pvoil_station/data/model/login/login_model.dart';
import 'package:pvoil_station/data/model/login/signup_model.dart';
import 'package:retrofit/retrofit.dart';

part 'services.g.dart';

@RestApi()
abstract class Services {
  factory Services(Dio dio, {String? baseUrl}) = _Services;
  // report

  @POST('/account/login/phone_number')
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> login(
      @Body() LoginModelRequest loginModelRequest);

  @POST('/user/{ownerId}/logout')
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> logout(
      @Path() String? ownerId, @Path() String? token);

  @POST('/account/register/phone_number')
  Future<HttpResponse<ApiResponse<LoginModelResponse?>?>> signup(
      @Body() SignUpModelRequest signUpModelRequest);

}
