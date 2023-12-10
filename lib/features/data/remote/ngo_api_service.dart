import 'package:dio/dio.dart';
import 'package:ngo/core/constants/constants.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/responses/auth_response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ngo_api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class NGOApiService {
  factory NGOApiService(Dio dio) = _NGOApiService;

  @GET('/product')
  Future<HttpResponse<List<ProductModel>>> getProducts();

  @POST('/donor/register')
  Future<HttpResponse<AuthResponse>> registerDonor(
      @Body() Map<String, dynamic> donorModel);

  @POST('/donor/verify')
  Future<HttpResponse<AuthResponse>> loginDonor(
      @Body() Map<String, dynamic> donorModel);

  @GET('/donor/view')
  Future<HttpResponse<VerifyResponse>> verifyDonor(
      @Header("Authorization") String token);
}
