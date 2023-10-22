import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_event.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_state.dart';

class RegisterDonorBloc extends Bloc<RegisterDonorEvent, RegisterDonorState> {
  RegisterDonorBloc() : super(InitialState()) {
    on<TextChangeEvent>(onTextChange);
  }

  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<RegisterDonorState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;

    switch (flag) {
      case 1:
        state.donorModel = state.donorModel.copyWith(donor_name: value);
      case 2:
        state.donorModel = state.donorModel.copyWith(donor_mob_number: value);
      case 3:
        state.donorModel = state.donorModel.copyWith(donor_address: value);
      case 4:
        state.donorModel = state.donorModel.copyWith(donor_email: value);
      case 5:
        state.donorModel = state.donorModel.copyWith(donor_id_type: value);
      case 6:
        state.donorModel = state.donorModel.copyWith(donor_id_number: value);
      case 7:
        state.donorModel = state.donorModel.copyWith(donor_pan_number: value);
      case 8:
        state.donorModel = state.donorModel
            .copyWith(donor_anonymous: !state.donorModel.donor_anonymous!);
    }
    print("Hello chekcing  : ${state.donorModel}");
  }

  void onRegisterPresses(
      RegisterDonorSubmittedEvent registerDonorSubmittedEvent,
      Emitter<RegisterDonorState> emit) async {
    DonorModel donor = state.donorModel;
  }
}
