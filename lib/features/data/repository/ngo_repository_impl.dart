import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/auth_response.dart';
import 'package:ngo/features/data/remote/ngo_api_service.dart';
import 'package:ngo/features/domain/repository/nog_repository.dart';

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
          await _ngoApiService.registerdonor(donorModel.toJson());
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
  Future<DataState<AuthResponse>> verifyDonor(DonorModel donorModel) async {
    try {
      final httpResponse =
          await _ngoApiService.verifydonor(donorModel.toJson());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.message);
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
}
