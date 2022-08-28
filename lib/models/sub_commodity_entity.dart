import 'dart:convert';
import 'package:geekshop/generated/json/base/json_field.dart';
import 'package:geekshop/generated/json/sub_commodity_entity.g.dart';

@JsonSerializable()
class SubCommodityEntity {

	int? total;
	List<SubCommodityRows>? rows;
	int? code;
	String? msg;
  
  SubCommodityEntity();

  factory SubCommodityEntity.fromJson(Map<String, dynamic> json) => $SubCommodityEntityFromJson(json);

  Map<String, dynamic> toJson() => $SubCommodityEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SubCommodityRows {

	dynamic searchValue;
	String? createBy;
	String? createTime;
	String? updateBy;
	String? updateTime;
	String? remark;
	SubCommodityRowsParams? params;
	int? id;
	int? commodityId;
	String? blockchainAddress;
	String? holder;
	String? cover;
	double? price;
	int? stock;
  
  SubCommodityRows();

  factory SubCommodityRows.fromJson(Map<String, dynamic> json) => $SubCommodityRowsFromJson(json);

  Map<String, dynamic> toJson() => $SubCommodityRowsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SubCommodityRowsParams {


  
  SubCommodityRowsParams();

  factory SubCommodityRowsParams.fromJson(Map<String, dynamic> json) => $SubCommodityRowsParamsFromJson(json);

  Map<String, dynamic> toJson() => $SubCommodityRowsParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}