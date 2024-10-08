// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_goods_detail_model.dart';

FreeGoodDetailsModel _$FreeGoodDetailsFromJson(Map<String, dynamic> json) {
  return FreeGoodDetailsModel(
    freeGoodDetailId: json['freeGoodDetailId'] as int?,
    freeGoodMasterId: json['freeGoodMasterId'] as int?,
    productId: json['productId'] as int?,
    productCode: json['productCode'] as String?,
    productName: json['productName'] as String?,
    productDefinitionId: json['productDefinitionId'] as int?,
    typeId: json['typeId'] as int?,
    typeText: json['typeText'] as String?,
    minimumQuantity: json['minimumQuantity'] as int?,
    forEachQuantity: json['forEachQuantity'] as int?,
    freeGoodQuantity: json['freeGoodQuantity'] as int?,
    freeGoodGroupId: json['freeGoodGroupId'] as int?,
    maximumFreeGoodQuantity: json['maximumFreeGoodQuantity'] as int?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    isActive: json['isActive'] as bool?,
    status: json['status'] as String?,
    isDifferentProduct: json['isDifferentProduct'] as bool?,
    freeGoodExclusives: (jsonDecode(json['freeGoodExclusives']) as List<dynamic>?)
        ?.map((e) => FreeGoodExclusivesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FreeGoodDetailsToJson(FreeGoodDetailsModel instance) =>
    <String, dynamic>{
      'freeGoodDetailId': instance.freeGoodDetailId,
      'freeGoodMasterId': instance.freeGoodMasterId,
      'productId': instance.productId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productDefinitionId': instance.productDefinitionId,
      'typeId': instance.typeId,
      'typeText': instance.typeText,
      'minimumQuantity': instance.minimumQuantity,
      'forEachQuantity': instance.forEachQuantity,
      'freeGoodQuantity': instance.freeGoodQuantity,
      'freeGoodGroupId': instance.freeGoodGroupId,
      'maximumFreeGoodQuantity': instance.maximumFreeGoodQuantity,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isActive': boolToInt(instance.isActive),
      'status': instance.status,
      'isDifferentProduct': boolToInt(instance.isDifferentProduct),
      'freeGoodExclusives': jsonEncode(instance.freeGoodExclusives),
    };
