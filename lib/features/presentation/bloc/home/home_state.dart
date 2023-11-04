import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/product.dart';

abstract class HomeState extends Equatable {
  final List<ProductModel>? products;
  final DioError? error;

  const HomeState({this.products, this.error});

  @override
  List<Object?> get props => [products];
}

class LoadingState extends HomeState {
  const LoadingState();
}

class GetProductsState extends HomeState {
  const GetProductsState();
}

class GetProductsDoneState extends HomeState {
  const GetProductsDoneState(List<ProductModel>? products)
      : super(products: products);
}

class ErrorState extends HomeState {
  const ErrorState(DioError error) : super(error: error);
}
