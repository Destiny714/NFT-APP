import 'dart:convert';
import 'package:geekshop/generated/json/base/json_field.dart';
import 'package:geekshop/generated/json/commodity_list_entity.g.dart';

@JsonSerializable()
class CommodityListEntity {

	int? total;
	List<CommodityListRows>? rows;
	int? code;
	String? msg;
  
  CommodityListEntity();

  factory CommodityListEntity.fromJson(Map<String, dynamic> json) => $CommodityListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommodityListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommodityListRows {

	dynamic searchValue;
	String? createBy;
	String? createTime;
	String? updateBy;
	String? updateTime;
	String? remark;
	CommodityListRowsParams? params;
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
	int? saleTime;
	int? offShelvesTime;
	int? state;
  
  CommodityListRows();

  factory CommodityListRows.fromJson(Map<String, dynamic> json) => $CommodityListRowsFromJson(json);

  Map<String, dynamic> toJson() => $CommodityListRowsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CommodityListRowsParams {


  
  CommodityListRowsParams();

  factory CommodityListRowsParams.fromJson(Map<String, dynamic> json) => $CommodityListRowsParamsFromJson(json);

  Map<String, dynamic> toJson() => $CommodityListRowsParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}