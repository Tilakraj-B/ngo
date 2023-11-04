import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/donor.dart';

abstract class LoginDonorState extends Equatable {
  DonorModel donorModel = DonorModel(
    donor_mob_number: "",
    donor_email: "",
  );
  final DioError? error;

  LoginDonorState({this.error});

  @override
  List<Object?> get props => [donorModel];
}

class InitialState extends LoginDonorState {}

class LoadingState extends LoginDonorState {}

class InvalidState extends LoginDonorState {}

class ValidState extends LoginDonorState {}

class ErrorState extends LoginDonorState {
  ErrorState(DioError? error) : super(error: error);
}
