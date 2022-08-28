import 'dart:convert';
import 'package:geekshop/generated/json/base/json_field.dart';
import 'package:geekshop/generated/json/commodity_detail_entity.g.dart';

@JsonSerializable()
class CommodityDetailEntity {

	String? msg;
	int? code;
	CommodityDetailData? data;
  
  CommodityDetailEntity();

  factory CommodityDetailEntity.fromJson(Map<String, dynamic> json) => $CommodityDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommodityDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommodityDetailData {

	dynamic searchValue;
	String? createBy;
	String? createTime;
	String? updateBy;
	String? updateTime;
	String? remark;
	CommodityDetailDataParams? params;
	int? id;
	int? creatorId;
	int? debutedTime;
	String? name;
	String? cover;
	String? resume;
	double? price;
	int? stock;
	String? details;
	int? saleMode;
	dynamic saleTime;
	dynamic offShelvesTime;
	int? state;
  
  CommodityDetailData();

  factory CommodityDetailData.fromJson(Map<String, dynamic> json) => $CommodityDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CommodityDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommodityDetailDataParams {


  
  CommodityDetailDataParams();

  factory CommodityDetailDataParams.fromJson(Map<String, dynamic> json) => $CommodityDetailDataParamsFromJson(json);

  Map<String, dynamic> toJson() => $CommodityDetailDataParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}