import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/presentation/bloc/home/home_event.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';

import '../../../domain/usecase/get_products.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductUseCase _getProductUseCase;

  HomeBloc(this._getProductUseCase) : super(GetProductsState()) {
    on<GetProducts>(getProducts);
  }

  void getProducts(GetProductsState, Emitter<HomeState> emit) async {
    emit(LoadingState());
    final dataState = await _getProductUseCase();
    if (dataState is DataSuccess) {
      emit(GetProductsDoneState(dataState.data));
    } else {
      emit(ErrorState(dataState.error!));
    }
  }
}
