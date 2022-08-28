import 'dart:convert';
import '../generated/json/base/json_field.dart';
import '../generated/json/item_model_entity.g.dart';

@JsonSerializable()
class ItemModelEntity {

	late String id;
	late String productCode;
	late String productNo;
	late String productName;
	late String thumbnailPath;
	late double tagPrice;
	late double salePrice;
	late String shopNo;
	late String shopName;
	dynamic shopAddress;
	dynamic proName;
	dynamic proNameApp;
	dynamic zoneQsLevel;
	late String brandDetailNo;
	late int isTop;
	dynamic activityTypeStr;
	dynamic templateNo;
	dynamic proNo;
	late bool ifActivity;
  
  ItemModelEntity();

  factory ItemModelEntity.fromJson(Map<String, dynamic> json) => $ItemModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ItemModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}