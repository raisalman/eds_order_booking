// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_condition_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceConditionDetailModel _$PriceConditionDetailFromJson(Map<String, dynamic> json) {
  return PriceConditionDetailModel(
    priceConditionDetailId: json['priceConditionDetailId'] as int?,
    amount: json['amount'] as double?,
    isScale: (json['isScale'] as bool?),
    validFrom: json['validFrom'] as String?,
    validTo: json['validTo'] as String?,
    type: json['type'] as int?,
    priceConditionId: json['priceConditionId'] as int?,
    isDeleted: (json['isDeleted'] as bool?),
    productId: json['productId'] as int?,
    productDefinitionId: json['productDefinitionId'] as int?,
    outletId: json['outletId'] as int?,
    routeId: json['routeId'] as int?,
    distributionId: json['distributionId'] as int?,
    minimumQuantity: json['minimumQuantity'] as int?,
    maximumLimit: json['maximumLimit'] as double?,
    limitBy: json['limitBy'] as int?,
    cartonAmount: json['cartonAmount'] as double?,
    packageId: json['packageId'] as int?,
    bundleId: json['bundleId'] as int?,
  );
}

Map<String, dynamic> _$PriceConditionDetailToJson(
    PriceConditionDetailModel instance) =>
    <String, dynamic>{
      'priceConditionDetailId': instance.priceConditionDetailId,
      'amount': instance.amount,
      'isScale': boolToInt(instance.isScale),
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
      'type': instance.type,
      'priceConditionId': instance.priceConditionId,
      'isDeleted': boolToInt(instance.isDeleted),
      'productId': instance.productId,
      'productDefinitionId': instance.productDefinitionId,
      'outletId': instance.outletId,
      'routeId': instance.routeId,
      'distributionId': instance.distributionId,
      'minimumQuantity': instance.minimumQuantity,
      'maximumLimit': instance.maximumLimit,
      'limitBy': instance.limitBy,
      'cartonAmount': instance.cartonAmount,
      'packageId': instance.packageId,
      'bundleId': instance.bundleId,
    };
