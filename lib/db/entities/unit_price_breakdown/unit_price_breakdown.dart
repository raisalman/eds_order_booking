import 'package:json_annotation/json_annotation.dart';

import '../../../utils/utils.dart';

part 'unit_price_breakdown.g.dart';

@JsonSerializable()
class UnitPriceBreakDown {
  @JsonKey(name: 'pk_upbd')
  int? id;

  @JsonKey(name: 'orderId')
  int? orderId;

  @JsonKey(name: 'mobileOrderDetailId')
  int? orderDetailId;

  @JsonKey(name: 'priceCondition')
  String? priceCondition;

  @JsonKey(name: 'priceConditionType')
  String? priceConditionType;

  @JsonKey(name: 'priceConditionClass')
  String? priceConditionClass;

  @JsonKey(name: 'priceConditionClassOrder')
  int? priceConditionClassOrder;

  @JsonKey(name: 'priceConditionClassId')
  int? priceConditionClassId;

  @JsonKey(name: 'priceConditionId')
  int? priceConditionId;

  @JsonKey(name: 'priceConditionDetailId')
  int? priceConditionDetailId;

  @JsonKey(name: 'accessSequence')
  String? accessSequence;

  @JsonKey(name: 'unitPrice')
  double? unitPrice;

  @JsonKey(name: 'blockPrice')
  double? blockPrice;

  @JsonKey(name: 'totalPrice')
  double? totalPrice;

  @JsonKey(name: 'calculationType')
  int? calculationType;

  @JsonKey(name: 'outletId')
  int? outletId;

  @JsonKey(name: 'productId')
  int? productId;

  @JsonKey(name: 'productDefinitionId')
  int? productDefinitionId;

  @JsonKey(name: 'isMaxLimitReached',toJson:boolToInt,fromJson:boolFromInt)
  bool? isMaxLimitReached;

  @JsonKey(name: 'maximumLimit')
  double? maximumLimit;

  @JsonKey(name: 'alreadyAvailed')
  double? alreadyAvailed;

  @JsonKey(name: 'limitBy')
  int? limitBy;

  UnitPriceBreakDown({
    this.id,
    this.orderId,
    this.orderDetailId,
    this.priceCondition,
    this.priceConditionType,
    this.priceConditionClass,
    this.priceConditionClassOrder,
    this.priceConditionClassId,
    this.priceConditionId,
    this.priceConditionDetailId,
    this.accessSequence,
    this.unitPrice,
    this.blockPrice,
    this.totalPrice,
    this.calculationType,
    this.outletId,
    this.productId,
    this.productDefinitionId,
    this.isMaxLimitReached,
    this.maximumLimit,
    this.alreadyAvailed,
    this.limitBy,
  });

  factory UnitPriceBreakDown.fromJson(Map<String, dynamic> json) =>
      _$UnitPriceBreakDownFromJson(json);

  Map<String, dynamic> toJson() => _$UnitPriceBreakDownToJson(this);
}
