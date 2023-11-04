// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['product_title'] as String?,
      json['product_category'] as String?,
      (json['product_pictures_before'] as List<dynamic>?)
          ?.map((e) => PictureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['product_pictures_after'] as List<dynamic>?)
          ?.map((e) => PictureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_description_before'] as String?,
      json['product_description_after'] as String?,
      json['product_defects_before'] as String?,
      json['product_defects_after'] as String?,
      json['product_area_of_donation'] as String?,
      json['product_collection_status'] as bool?,
      json['product_reimbursement_status'] as bool?,
      json['product_repair_status'] as bool?,
      (json['product_repair_amount'] as num?)?.toDouble(),
      json['product_received'] as bool?,
      json['product_donor'] as String?,
      json['product_agent'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'product_title': instance.product_title,
      'product_category': instance.product_category,
      'product_pictures_before': instance.product_pictures_before,
      'product_pictures_after': instance.product_pictures_after,
      'product_description_before': instance.product_description_before,
      'product_description_after': instance.product_description_after,
      'product_defects_before': instance.product_defects_before,
      'product_defects_after': instance.product_defects_after,
      'product_area_of_donation': instance.product_area_of_donation,
      'product_collection_status': instance.product_collection_status,
      'product_reimbursement_status': instance.product_reimbursement_status,
      'product_repair_status': instance.product_repair_status,
      'product_repair_amount': instance.product_repair_amount,
      'product_received': instance.product_received,
      'product_donor': instance.product_donor,
      'product_agent': instance.product_agent,
    };
