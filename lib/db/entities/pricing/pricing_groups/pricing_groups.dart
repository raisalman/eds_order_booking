import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/utils.dart';

part 'pricing_groups.g.dart';

@JsonSerializable()
class PricingGroups {
  @JsonKey(name: 'pricingGroupId')
  final int? pricingGroupId;

  @JsonKey(name: 'pricingGroupName')
  final String? pricingGroupName;

  @JsonKey(name: 'status',toJson: boolToInt,fromJson: boolFromInt)
  final bool? status;

  PricingGroups({
    this.pricingGroupId,
    this.pricingGroupName,
    this.status,
  });

  factory PricingGroups.fromJson(Map<String, dynamic> json) => _$PricingGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$PricingGroupsToJson(this);
}
