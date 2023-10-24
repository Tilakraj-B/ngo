import 'package:equatable/equatable.dart';
import 'package:ngo/features/domain/entity/picture.dart';

class ProductEntity extends Equatable {
  String? productTitle;
  String? productCategory;
  List<PictureEntity>? productPicturesBefore;
  List<PictureEntity>? productPicturesAfter;
  String? productDescriptionBefore;
  String? productDescriptionAfter;
  String? productDefectsBefore;
  String? productDefectsAfter;
  String? productAreaOfDonation;
  bool? productCollectionStatus;
  bool? productReimbursementStatus;
  bool? productRepairStatus;
  double? productRepairAmount;
  bool? productReceived;
  String? productDonor;
  String? productAgent;
  String? remark1;
  String? remark2;
  String? remark3;
  String? remark4;
  String? remark5;

  ProductEntity({
    this.productTitle,
    this.productCategory,
    this.productPicturesBefore,
    this.productPicturesAfter,
    this.productDescriptionBefore,
    this.productDescriptionAfter,
    this.productDefectsBefore,
    this.productDefectsAfter,
    this.productAreaOfDonation,
    this.productCollectionStatus,
    this.productReimbursementStatus,
    this.productRepairStatus,
    this.productRepairAmount,
    this.productReceived,
    this.productDonor,
    this.productAgent,
    this.remark1,
    this.remark2,
    this.remark3,
    this.remark4,
    this.remark5,
  });

  @override
  List<Object?> get props {
    return [
      productTitle,
      productCategory,
      productPicturesBefore,
      productPicturesAfter,
      productDescriptionBefore,
      productDescriptionAfter,
      productDefectsBefore,
      productDefectsAfter,
      productAreaOfDonation,
      productCollectionStatus,
      productReimbursementStatus,
      productRepairStatus,
      productRepairAmount,
      productReceived,
      productDonor,
      productAgent,
      remark1,
      remark2,
      remark3,
      remark4,
      remark5,
    ];
  }
}
