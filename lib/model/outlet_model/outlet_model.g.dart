// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletModel _$OutletFromJson(Map<String, dynamic> json) => OutletModel(
      outletId: json['outletId'] as int?,
      routeId: json['routeId'] as int?,
      outletCode: json['outletCode'] as String?,
      outletName: json['outletName'] as String?,
      channelName: json['channelName'] as String?,
      location: json['location'] as String?,
      visitFrequency: json['visitFrequency'] as int?,
      visitDay: json['visitDay'] as int?,
      planned: json['planned'] as int?,
      sequenceNumber: json['sequenceNumber'] as int?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      visitTimeLat: (json['visitTimeLat'] as num?)?.toDouble(),
      visitTimeLng: (json['visitTimeLng'] as num?)?.toDouble(),
      lastSaleDate: json['lastSaleDate'] as int?,
      pricingGroupId: json['pricingGroupId'] as int?,
      vpoClassificationId: json['vpoClassificationId'] as int?,
      channelId: json['channelId'] as int?,
      lastSaleQuantity: json['lastSaleQuantity'] as String?,
      availableCreditLimit: (json['availableCreditLimit'] as num?)?.toDouble(),
      outstandingCredit: (json['outstandingCreditLimit'] as num?)?.toDouble(),
      lastSale: (json['lastSale'] as num?)?.toDouble(),
      visitStatus: json['visitStatus'] as int?,
      cnic: json['cnic'] as String?,
      strn: json['strn'] as String?,
      mtdSale: (json['mtdSale'] as num?)?.toDouble(),
      mobileNumber: json['mobileNumber'] as String?,
      hasHTHDiscount: (json['hasHTHDiscount'] is int)
          ? boolFromInt(json['hasHTHDiscount'] as int?)
          : (json['hasHTHDiscount'] as bool?),
      hasRentalDiscount: (json['hasRentalDiscount'] is int)
          ? boolFromInt(json['hasRentalDiscount'] as int?)
          : (json['hasRentalDiscount'] as bool?),
      hasExclusivityFee: (json['hasExclusivityFee'] is int)
          ? boolFromInt(json['hasExclusivityFee'] as int?)
          : (json['hasExclusivityFee'] as bool?),
      lastOrder: json['lastOrder'] == null
          ? null
          : LastOrder.fromJson((json['lastOrder'] is String)
              ? jsonDecode(json['lastOrder'])
              : json['lastOrder'] as Map<String, dynamic>),
      isAssetsScennedInTheLastMonth:
          (json['isAssetsScennedInTheLastMonth'] is int)
              ? boolFromInt(json['isAssetsScennedInTheLastMonth'] as int?)
              : (json['isAssetsScennedInTheLastMonth'] as bool?),
      synced: json['synced'] == null
          ? null
          : ((json['synced'] is int)
              ? boolFromInt(json['synced'] as int?)
              : (json['synced'] as bool?)),
      statusId: json['statusId'] as int?,
      isZeroSaleOutlet: (json['isZeroSaleOutlet'] is int)
          ? boolFromInt(json['isZeroSaleOutlet'] as int?)
          : (json['isZeroSaleOutlet'] as bool?),
      promoTypeId: json['promoTypeId'] as int?,
      customerRegistrationTypeId: json['customerRegistrationTypeId'] as int?,
      digitalAccount: json['digitalAccount'] as String?,
      disburseAmount: (json['disburseAmount'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      organizationId: json['organizationId'] as int?,
      outletPromoConfigId: json['outletPromoConfigId'] as int?,
      outletVisits: ((json['outletVisits'] is String)
              ? jsonDecode(json['outletVisits'])
              : json['outletVisits'] as List<dynamic>?)
          ?.map((e) => OutletVisit.fromJson(e as Map<String, dynamic>))
          .toList(),
      avlStockDetail: ((json['avlStockDetail'] is String)
              ? jsonDecode(json['avlStockDetail'])
              : json['avlStockDetail'] as List<dynamic>?)
          ?.map((e) => AvailableStock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OutletToJson(OutletModel instance) => <String, dynamic>{
      'outletId': instance.outletId,
      'routeId': instance.routeId,
      'outletCode': instance.outletCode,
      'outletName': instance.outletName,
      'channelName': instance.channelName,
      'location': instance.location,
      'visitFrequency': instance.visitFrequency,
      'visitDay': instance.visitDay,
      'planned': instance.planned,
      'sequenceNumber': instance.sequenceNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'visitTimeLat': instance.visitTimeLat,
      'visitTimeLng': instance.visitTimeLng,
      'lastSaleDate': instance.lastSaleDate,
      'pricingGroupId': instance.pricingGroupId,
      'vpoClassificationId': instance.vpoClassificationId,
      'channelId': instance.channelId,
      'lastSaleQuantity': instance.lastSaleQuantity,
      'availableCreditLimit': instance.availableCreditLimit,
      'outstandingCreditLimit': instance.outstandingCredit,
      'lastSale': instance.lastSale,
      'visitStatus': instance.visitStatus,
      'cnic': instance.cnic,
      'strn': instance.strn,
      'mtdSale': instance.mtdSale,
      'mobileNumber': instance.mobileNumber,
      'hasHTHDiscount': boolToInt(instance.hasHTHDiscount),
      'hasRentalDiscount': boolToInt(instance.hasRentalDiscount),
      'hasExclusivityFee': boolToInt(instance.hasExclusivityFee),
      'lastOrder': jsonEncode(instance.lastOrder),
      'isAssetsScennedInTheLastMonth':
          boolToInt(instance.isAssetsScennedInTheLastMonth),
      'synced': instance.synced != null ? boolToInt(instance.synced) : null,
      'statusId': instance.statusId,
      'isZeroSaleOutlet': boolToInt(instance.isZeroSaleOutlet),
      'promoTypeId': instance.promoTypeId,
      'customerRegistrationTypeId': instance.customerRegistrationTypeId,
      'digitalAccount': instance.digitalAccount,
      'disburseAmount': instance.disburseAmount,
      'remarks': instance.remarks,
      'organizationId': instance.organizationId,
      'outletPromoConfigId': instance.outletPromoConfigId,
      'outletVisits': jsonEncode(instance.outletVisits),
      'avlStockDetail': jsonEncode(instance.avlStockDetail),
    };
