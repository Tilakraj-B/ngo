import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/domain/usecase/donate_product.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donation_form_event.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donation_form_state.dart';

import '../../../../core/resources/data_state.dart';

class DonationFormBloc extends Bloc<DonationFormEvent, DonationFormState> {
  final DonateProductUseCase _donateProductUseCase;

  DonationFormBloc(this._donateProductUseCase)
      : super(InitialState(ProductModel(
          product_title: "",
          product_category: "",
          product_description_before: "",
          product_defects_before: "",
          product_area_of_donation: "",
        ))) {
    on<TextChangeEvent>(onTextChange);
    on<LoginDonorSubmitted>(onLoginPresses);
  }
  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<DonationFormState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;

    switch (flag) {
      case 1:
    }
    print("DonationForm onTextChange : ${state.productModel}");
  }

  void onLoginPresses(LoginDonorSubmitted loginDonorSubmitted,
      Emitter<DonationFormState> emit) async {
    emit(LoadingState(state.productModel!));
    print("Donor Model in login : ${state.productModel}");
    final dataState = await _donateProductUseCase(parms: state.productModel);
    print("LoginState : ${dataState.data}");
    if (dataState is DataSuccess) {
      print("successs : ${dataState.data}");
      emit(SuccessState(state.productModel!));
    } else if (dataState is DataFailure) {
      emit(InitialState(state.productModel!));
      print("LoginError : ${dataState.error}");
    }
  }
}
