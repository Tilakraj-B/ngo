import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_event.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_state.dart';

class LoginDonorBloc extends Bloc<LoginDonorEvent, LoginDonorState> {
  LoginDonorBloc() : super(InitialState()) {
    on<TextChangeEvent>(onTextChange);
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

  void onRegisterPresses(
      RegisterDonorSubmittedEvent registerDonorSubmittedEvent,
      Emitter<LoginDonorState> emit) async {
    DonorModel donor = state.donorModel;
  }
}
