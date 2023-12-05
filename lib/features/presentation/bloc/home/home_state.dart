import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/product.dart';

abstract class HomeState extends Equatable {
  final List<ProductModel>? products;
  final int? index;
  final DioError? error;
  final bool? isLoggedIn;

  const HomeState({this.products, this.error, this.index, this.isLoggedIn});

  @override
  List<Object?> get props => [products, error, index];
}

class LoadingState extends HomeState {
  const LoadingState();
}

class GetProductsState extends HomeState {
  const GetProductsState();
}

class GetProductsDoneState extends HomeState {
  const GetProductsDoneState(List<ProductModel>? products, bool isLoggedIn)
      : super(products: products, isLoggedIn: isLoggedIn);
}

class ProductDetailsState extends HomeState {
  const ProductDetailsState(int? index, List<ProductModel>? products)
      : super(index: index, products: products);
}

class ErrorState extends HomeState {
  const ErrorState(DioError error) : super(error: error);
}
