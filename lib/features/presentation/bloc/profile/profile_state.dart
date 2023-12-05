import 'package:ngo/features/data/model/donor.dart';

abstract class ProfileState {
  final DonorModel donorModel;
  ProfileState({required this.donorModel});
}
