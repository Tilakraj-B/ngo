import 'package:ngo/features/domain/entity/Donor.dart';

class DonorModel extends DonorEntity {
  DonorModel(
      {super.donor_name,
      required super.donor_mob_number,
      super.donor_address,
      required super.donor_email,
      super.donor_id_type,
      super.donor_id_number,
      super.donor_pan_number,
      required super.donor_anonymous});

  factory DonorModel.fromJson(Map<String, dynamic> map) {
    return DonorModel(
        donor_name: map['donor_name'],
        donor_mob_number: map['donor_mob_number'],
        donor_address: map['donor_address'],
        donor_email: map['donor_email'],
        donor_id_type: map['donor_id_type'],
        donor_id_number: map['donor_id_number'],
        donor_pan_number: map['donor_pan_number'],
        donor_anonymous: map['donor_anonymous']);
  }

  DonorModel copyWith(
      {String? donor_name,
      String? donor_mob_number,
      String? donor_address,
      String? donor_email,
      String? donor_id_type,
      String? donor_id_number,
      String? donor_pan_number,
      bool? donor_anonymous}) {
    return DonorModel(
        donor_name: donor_name ?? this.donor_name,
        donor_mob_number: donor_mob_number ?? this.donor_mob_number,
        donor_address: donor_address ?? this.donor_address,
        donor_email: donor_email ?? this.donor_email,
        donor_id_type: donor_id_type ?? this.donor_id_type,
        donor_id_number: donor_id_number ?? this.donor_id_number,
        donor_pan_number: donor_pan_number ?? this.donor_pan_number,
        donor_anonymous: donor_anonymous ?? this.donor_anonymous);
  }
}
