import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/product.dart';

abstract class DonationFormState extends Equatable {
  ProductModel? productModel;
  final DioError? error;

  DonationFormState({this.productModel, this.error});

  @override
  List<Object?> get props => [productModel, error];
}

class InitialState extends DonationFormState {
  InitialState(ProductModel productModel) : super(productModel: productModel);
}

class LoadingState extends DonationFormState {
  LoadingState(ProductModel productModel) : super(productModel: productModel);
}

class InvalidState extends DonationFormState {
  InvalidState(ProductModel productModel) : super(productModel: productModel);
}

class ErrorState extends DonationFormState {
  ErrorState(ProductModel productModel, DioError? error)
      : super(productModel: productModel, error: error);
}

class SuccessState extends DonationFormState {
  SuccessState(ProductModel productModel) : super(productModel: productModel);
}
