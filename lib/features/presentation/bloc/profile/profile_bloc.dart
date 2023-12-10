import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_event.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_state.dart';

import '../../../data/model/donor.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final storage = const FlutterSecureStorage();

  ProfileBloc() : super(InitializingState()) {
    on<DisplayDonationEvent>(displayDonation);
    on<InitalizeDonorProfileEvent>(loadDonarProfile);
  }

  void loadDonarProfile(InitalizeDonorProfileEvent initalizeDonorProfileEvent,
      Emitter<ProfileState> emit) async {
    emit(LoadingState());
    late String serializedDonor;
    try {
      serializedDonor = await storage.read(key: "donor") ?? "null";
      if (serializedDonor == "null") {
        throw Exception("donor data not found");
      }
    } catch (e) {
      emit(ErrorState(error: "donor data not found"));
    }

    DonorModel donorModel =
        await DonorModel.fromJson(jsonDecode(serializedDonor));
    emit(InitialState(donorModel: donorModel));
  }

  void displayDonation(
    DisplayDonationEvent event,
    Emitter<ProfileState> state,
  ) {
    print("dispalay Donation : Display Donation Emitter");
    emit(DisplayDonation(index: event.index, donorModel: event.donorModel));
  }
}
