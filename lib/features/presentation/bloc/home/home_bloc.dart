import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/domain/usecase/verify_donor.dart';
import 'package:ngo/features/presentation/bloc/home/home_event.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';

import '../../../domain/usecase/get_products.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductUseCase _getProductUseCase;
  final VerifyDonorUseCase _verifyDonorUseCase;
  final storage = const FlutterSecureStorage();

  HomeBloc(this._getProductUseCase, this._verifyDonorUseCase)
      : super(GetProductsState()) {
    on<GetProductsEvent>(getProducts);
    on<DisplayProductEvent>(displayProduct);
  }

  void getProducts(
      GetProductsEvent getProductsEvent, Emitter<HomeState> emit) async {
    emit(const LoadingState());
    String token = await storage.read(key: 'loginToken') ?? "null";
    bool result = token == "null" ? false : await verifyUser(token!);

    if (state.products == null) {
      print("getProducts : Getting Products from database");
      final dataState = await _getProductUseCase();
      if (dataState is DataSuccess) {
        emit(GetProductsDoneState(dataState.data, result));
      } else {
        emit(ErrorState(dataState.error!));
      }
    } else {
      emit(GetProductsDoneState(state.products, result));
    }
  }

  void displayProduct(
      DisplayProductEvent displayProductEvent, Emitter<HomeState> emit) {
    print("Display Product Triggered");
    emit(ProductDetailsState(displayProductEvent.index, state.products));
  }

  Future<bool> verifyUser(String token) async {
    final dataState = await _verifyDonorUseCase(parms: token);
    if (dataState is DataSuccess) {
      print("Verification Successfully : ${dataState.data!.donor}");
      String serializedDonor = jsonEncode(dataState.data!.donor);
      storage.write(key: "donor", value: serializedDonor);
      print("verifyUser : donor data saved to storage");
      print("donor data : ${dataState.data!.donor}");
      return true;
    } else {
      print("Verification Error : ${ErrorState(dataState.error!)}");
      storage.write(key: "loginToken", value: "null");
      return false;
    }
  }
}
