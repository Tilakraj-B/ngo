import 'package:ngo/features/data/model/donor.dart';

abstract class ProfileState {
  final DonorModel? donorModel;
  ProfileState({this.donorModel});
}

class InitializingState extends ProfileState {}

class InitialState extends ProfileState {
  InitialState({required super.donorModel});
}

class DisplayDonation extends ProfileState {
  int index;
  DisplayDonation({required this.index, required super.donorModel});
}

class ErrorState extends ProfileState {
  final String error;
  ErrorState({required this.error, super.donorModel});
}

class LoadingState extends ProfileState {
  LoadingState({super.donorModel});
}
