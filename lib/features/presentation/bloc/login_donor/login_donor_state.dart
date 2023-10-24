import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/donor.dart';

abstract class LoginDonorState extends Equatable {
  DonorModel donorModel = DonorModel(
    donor_mob_number: "",
    donor_email: "",
  );

  @override
  List<Object?> get props => [donorModel];
}

class InitialState extends LoginDonorState {}

class InvalidState extends LoginDonorState {}

class ValidState extends LoginDonorState {}

class ErrorState extends LoginDonorState {}
