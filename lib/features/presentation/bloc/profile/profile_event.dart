import '../../../data/model/donor.dart';

abstract class ProfileEvent {}

class InitalizeDonorProfileEvent extends ProfileEvent {}

class DisplayDonationEvent extends ProfileEvent {
  final int index;
  final DonorModel donorModel;
  DisplayDonationEvent({required this.index, required this.donorModel});
}
