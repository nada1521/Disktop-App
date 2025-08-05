import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/core/network/api_constans.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstans.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET(ApiConstans.login)
  Future <LogInResponseModel> login(
  @Query('email')String email  ,
 @Query('password') String password
  );

   @GET(ApiConstans.home)
  Future <LogInResponseModel> home(
  @Query('auth_token')String authToken  ,
 
  );
}
