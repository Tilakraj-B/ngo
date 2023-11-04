import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/domain/usecase/verify_donor.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_event.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_state.dart';

class LoginDonorBloc extends Bloc<LoginDonorEvent, LoginDonorState> {
  final VerifyDonorUseCase _verifyDonorUseCase;

  LoginDonorBloc(this._verifyDonorUseCase) : super(InitialState()) {
    on<TextChangeEvent>(onTextChange);
    on<LoginDonorSubmitted>(onLoginPresses);
  }
  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<LoginDonorState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;

    switch (flag) {
      case 1:
        state.donorModel = state.donorModel.copyWith(donor_email: value);
      case 2:
        state.donorModel = state.donorModel.copyWith(donor_mob_number: value);
    }
    print("Hello chekcing  : ${state.donorModel}");
  }

  void onLoginPresses(LoginDonorSubmitted loginDonorSubmitted,
      Emitter<LoginDonorState> emit) async {
    emit(LoadingState());
    final dataState = await _verifyDonorUseCase(parms: state.donorModel);
    if (dataState is DataSuccess) {
      print("success : ${dataState.data!.message}");
      emit(InitialState());
    } else {
      emit(InitialState());

      print("error : ${dataState.error}");
    }
  }
}
