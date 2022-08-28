import 'dart:convert';
import 'package:geekshop/generated/json/base/json_field.dart';
import 'package:geekshop/generated/json/user_detail_entity.g.dart';

@JsonSerializable()
class UserDetailEntity {

	String? msg;
	int? code;
	UserDetailData? data;
  
  UserDetailEntity();

  factory UserDetailEntity.fromJson(Map<String, dynamic> json) => $UserDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDetailData {

	dynamic searchValue;
	String? createBy;
	String? createTime;
	String? updateBy;
	dynamic updateTime;
	dynamic remark;
	UserDetailDataParams? params;
	int? id;
	String? portrait;
	String? nickname;
	String? phone;
	dynamic blockAddress;
	int? registerTime;
	String? type;
	String? verifiedState;
	dynamic tags;
  
  UserDetailData();

  factory UserDetailData.fromJson(Map<String, dynamic> json) => $UserDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDetailDataParams {


  
  UserDetailDataParams();

  factory UserDetailDataParams.fromJson(Map<String, dynamic> json) => $UserDetailDataParamsFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailDataParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}