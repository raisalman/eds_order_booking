import 'package:json_annotation/json_annotation.dart';
import 'package:order_booking/db/models/outlet_visit/outlet_visit.dart';

import '../../db/entities/customer_input/customer_input.dart';
import '../../db/entities/market_returns/market_returns.dart';
import '../../db/entities/task/task.dart';
import '../../db/models/base_response/base_response.dart';
import '../../utils/util.dart';
import '../market_return_model/market_return_model.dart';
import '../merchandise_upload_model/merchandise_upload_model.dart';
import '../order_response_model/order_response_model.dart';
part 'master_model.g.dart';

@JsonSerializable()
class MasterModel extends BaseResponse {
  @JsonKey(name: 'outletId')
  int? outletId;

  @JsonKey(name: 'outletCode')
  String? outletCode;

  @JsonKey(name: 'outletStatus')
  int? outletStatus;

  @JsonKey(name: 'reason')
  String? reason;

  @JsonKey(name: 'requestCounter')
  int? requestCounter;

  @JsonKey(name: 'salesmanId')
  int? salesmanId;

  @JsonKey(name: 'outletVisitTime')
  int? outletVisitTime; // Timestamp

  @JsonKey(name: 'outletEndTime')
  int? outletEndTime; // Timestamp

  @JsonKey(ignore: true)
  String? outletOpenTime;

  @JsonKey(ignore: true)
  String? outletCloseTime;

  @JsonKey(name: 'dailyOutletVisit')
  MerchandiseUploadModel? dailyOutletVisit;

  @JsonKey(name: 'latitude')
  double? latitude;

  @JsonKey(name: 'longitude')
  double? longitude;

  @JsonKey(name: 'customerInput')
  CustomerInput? customerInput;

  @JsonKey(name: 'order')
  OrderResponseModel? order;

  @JsonKey(name: 'marketReturns')
  MarketReturnsModel? marketReturns;

  @JsonKey(name: 'tasks')
  List<Task>? tasks;

  @JsonKey(name: 'outletLatitude')
  double? outletLatitude;

  @JsonKey(name: 'outletLongitude')
  double? outletLongitude;

  @JsonKey(name: 'outletDistance')
  int? outletDistance;

  @JsonKey(name: 'outletVisits')
  List<OutletVisit>? outletVisits;

  @JsonKey(name: 'startedDate')
  int? startedDate;

  MasterModel();

  // Methods to handle custom behavior if needed
  void setOutletVisitTime(int time) {
    outletVisitTime = time;
    outletOpenTime = Util.formatDate("HH:mm", time);
  }

  void setOutletEndTime(int time) {
    outletEndTime = time;
    outletCloseTime = Util.formatDate("HH:mm", time);
  }

  void setLocation(latitude, longitude) {
    this.latitude=latitude;
    this.longitude=longitude;
  }

  factory MasterModel.fromJson(Map<String, dynamic> json) =>
      _$MasterModelFromJson(json);

  Map<String, dynamic> toJson() => _$MasterModelToJson(this);


  Map<String, dynamic> serialize() => _$SerializeToJsonWithExcludedFields(this);
}
