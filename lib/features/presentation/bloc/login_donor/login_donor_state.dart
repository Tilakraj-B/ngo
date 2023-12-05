import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/donor.dart';

abstract class LoginDonorState extends Equatable {
  DonorModel? donorModel;
  final DioError? error;

  LoginDonorState({this.donorModel, this.error});

  @override
  List<Object?> get props => [donorModel];
}

class InitialState extends LoginDonorState {
  InitialState(DonorModel donorModel) : super(donorModel: donorModel);
}

class LoadingState extends LoginDonorState {
  LoadingState(DonorModel donorModel) : super(donorModel: donorModel);
}

class InvalidState extends LoginDonorState {
  InvalidState(DonorModel donorModel) : super(donorModel: donorModel);
}

class ErrorState extends LoginDonorState {
  ErrorState(DonorModel donorModel, DioError? error)
      : super(donorModel: donorModel, error: error);
}

class SuccessState extends LoginDonorState {
  SuccessState(DonorModel donorModel) : super(donorModel: donorModel);
}
