import 'package:ngo/features/data/model/picture.dart';
import 'package:ngo/features/domain/entity/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String? productTitle,
    String? productCategory,
    List<PictureModel>? productPicturesBefore,
    List<PictureModel>? productPicturesAfter,
    String? productDescriptionBefore,
    String? productDescriptionAfter,
    String? productDefectsBefore,
    String? productDefectsAfter,
    String? productAreaOfDonation,
    bool? productCollectionStatus,
    bool? productReimbursementStatus,
    bool? productRepairStatus,
    double? productRepairAmount,
    bool? productReceived,
    String? productDonor,
    String? productAgent,
    String? remark1,
    String? remark2,
    String? remark3,
    String? remark4,
    String? remark5,
  }) : super(
          productTitle: productTitle,
          productCategory: productCategory,
          productPicturesBefore: productPicturesBefore,
          productPicturesAfter: productPicturesAfter,
          productDescriptionBefore: productDescriptionBefore,
          productDescriptionAfter: productDescriptionAfter,
          productDefectsBefore: productDefectsBefore,
          productDefectsAfter: productDefectsAfter,
          productAreaOfDonation: productAreaOfDonation,
          productCollectionStatus: productCollectionStatus,
          productReimbursementStatus: productReimbursementStatus,
          productRepairStatus: productRepairStatus,
          productRepairAmount: productRepairAmount,
          productReceived: productReceived,
          productDonor: productDonor,
          productAgent: productAgent,
          remark1: remark1,
          remark2: remark2,
          remark3: remark3,
          remark4: remark4,
          remark5: remark5,
        );

  // Factory method to create a ProductModel from a JSON Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productTitle: json['productTitle'],
      productCategory: json['productCategory'],
      productPicturesBefore: (json['productPicturesBefore'] as List<dynamic>?)
          ?.map((e) => PictureModel.fromJson(e))
          .toList(),
      productPicturesAfter: (json['productPicturesAfter'] as List<dynamic>?)
          ?.map((e) => PictureModel.fromJson(e))
          .toList(),
      productDescriptionBefore: json['productDescriptionBefore'],
      productDescriptionAfter: json['productDescriptionAfter'],
      productDefectsBefore: json['productDefectsBefore'],
      productDefectsAfter: json['productDefectsAfter'],
      productAreaOfDonation: json['productAreaOfDonation'],
      productCollectionStatus: json['productCollectionStatus'],
      productReimbursementStatus: json['productReimbursementStatus'],
      productRepairStatus: json['productRepairStatus'],
      productRepairAmount: json['productRepairAmount'],
      productReceived: json['productReceived'],
      productDonor: json['productDonor'],
      productAgent: json['productAgent'],
      remark1: json['remark1'],
      remark2: json['remark2'],
      remark3: json['remark3'],
      remark4: json['remark4'],
      remark5: json['remark5'],
    );
  }

}
