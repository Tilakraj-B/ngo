import 'package:json_annotation/json_annotation.dart';
import 'package:ngo/features/data/model/picture.dart';
import 'package:ngo/features/domain/entity/product.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  ProductModel(
      super.product_title,
      super.product_category,
      super.product_pictures_before,
      super.product_pictures_after,
      super.product_description_before,
      super.product_description_after,
      super.product_defects_before,
      super.product_defects_after,
      super.product_area_of_donation,
      super.product_collection_status,
      super.product_reimbursement_status,
      super.product_repair_status,
      super.product_repair_amount,
      super.product_received,
      super.product_donor,
      super.product_agent);

  // Factory method to create a ProductModel from a JSON Map
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
