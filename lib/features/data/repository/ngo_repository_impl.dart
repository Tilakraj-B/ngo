import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/ngo_api_service.dart';
import 'package:ngo/features/data/remote/responses/auth_response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class NGORepositoryImpl implements NGORepository {
  final NGOApiService _ngoApiService;

  NGORepositoryImpl(this._ngoApiService);

  @override
  Future<DataState<List<ProductModel>>> getAllProducts() async {
    try {
      final httpResponse = await _ngoApiService.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<AuthResponse>> registerDonor(DonorModel donorModel) async {
    try {
      final httpResponse =
          await _ngoApiService.registerDonor(donorModel.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<AuthResponse>> loginDonor(DonorModel donorModel) async {
    try {
      print("Donor Model : ${donorModel}");
      final httpResponse = await _ngoApiService.loginDonor(donorModel.toJson());
      if (httpResponse.response.statusCode == HttpStatus.created) {
        print("Login Response : ${httpResponse.data.message}");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<VerifyResponse>> verifyDonor(String? token) async {
    print("Verify Donor : ${token}");
    try {
      final httpResponse = await _ngoApiService.verifyDonor("Bearer ${token}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.donor);
        print(httpResponse.data.iat);
        print(httpResponse.data.exp);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<VerifyResponse>> donateProduct(ProductModel productModel) {
    // TODO: implement donateProduct
    throw UnimplementedError();
  }
}
