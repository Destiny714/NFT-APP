import 'package:geekshop/generated/json/base/json_convert_content.dart';
import 'package:geekshop/models/item_model_entity.dart';

ItemModelEntity $ItemModelEntityFromJson(Map<String, dynamic> json) {
	final ItemModelEntity itemModelEntity = ItemModelEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		itemModelEntity.id = id;
	}
	final String? productCode = jsonConvert.convert<String>(json['productCode']);
	if (productCode != null) {
		itemModelEntity.productCode = productCode;
	}
	final String? productNo = jsonConvert.convert<String>(json['productNo']);
	if (productNo != null) {
		itemModelEntity.productNo = productNo;
	}
	final String? productName = jsonConvert.convert<String>(json['productName']);
	if (productName != null) {
		itemModelEntity.productName = productName;
	}
	final String? thumbnailPath = jsonConvert.convert<String>(json['thumbnailPath']);
	if (thumbnailPath != null) {
		itemModelEntity.thumbnailPath = thumbnailPath;
	}
	final double? tagPrice = jsonConvert.convert<double>(json['tagPrice']);
	if (tagPrice != null) {
		itemModelEntity.tagPrice = tagPrice;
	}
	final double? salePrice = jsonConvert.convert<double>(json['salePrice']);
	if (salePrice != null) {
		itemModelEntity.salePrice = salePrice;
	}
	final String? shopNo = jsonConvert.convert<String>(json['shopNo']);
	if (shopNo != null) {
		itemModelEntity.shopNo = shopNo;
	}
	final String? shopName = jsonConvert.convert<String>(json['shopName']);
	if (shopName != null) {
		itemModelEntity.shopName = shopName;
	}
	final dynamic? shopAddress = jsonConvert.convert<dynamic>(json['shopAddress']);
	if (shopAddress != null) {
		itemModelEntity.shopAddress = shopAddress;
	}
	final dynamic? proName = jsonConvert.convert<dynamic>(json['proName']);
	if (proName != null) {
		itemModelEntity.proName = proName;
	}
	final dynamic? proNameApp = jsonConvert.convert<dynamic>(json['proNameApp']);
	if (proNameApp != null) {
		itemModelEntity.proNameApp = proNameApp;
	}
	final dynamic? zoneQsLevel = jsonConvert.convert<dynamic>(json['zoneQsLevel']);
	if (zoneQsLevel != null) {
		itemModelEntity.zoneQsLevel = zoneQsLevel;
	}
	final String? brandDetailNo = jsonConvert.convert<String>(json['brandDetailNo']);
	if (brandDetailNo != null) {
		itemModelEntity.brandDetailNo = brandDetailNo;
	}
	final int? isTop = jsonConvert.convert<int>(json['isTop']);
	if (isTop != null) {
		itemModelEntity.isTop = isTop;
	}
	final dynamic? activityTypeStr = jsonConvert.convert<dynamic>(json['activityTypeStr']);
	if (activityTypeStr != null) {
		itemModelEntity.activityTypeStr = activityTypeStr;
	}
	final dynamic? templateNo = jsonConvert.convert<dynamic>(json['templateNo']);
	if (templateNo != null) {
		itemModelEntity.templateNo = templateNo;
	}
	final dynamic? proNo = jsonConvert.convert<dynamic>(json['proNo']);
	if (proNo != null) {
		itemModelEntity.proNo = proNo;
	}
	final bool? ifActivity = jsonConvert.convert<bool>(json['ifActivity']);
	if (ifActivity != null) {
		itemModelEntity.ifActivity = ifActivity;
	}
	return itemModelEntity;
}

Map<String, dynamic> $ItemModelEntityToJson(ItemModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['productCode'] = entity.productCode;
	data['productNo'] = entity.productNo;
	data['productName'] = entity.productName;
	data['thumbnailPath'] = entity.thumbnailPath;
	data['tagPrice'] = entity.tagPrice;
	data['salePrice'] = entity.salePrice;
	data['shopNo'] = entity.shopNo;
	data['shopName'] = entity.shopName;
	data['shopAddress'] = entity.shopAddress;
	data['proName'] = entity.proName;
	data['proNameApp'] = entity.proNameApp;
	data['zoneQsLevel'] = entity.zoneQsLevel;
	data['brandDetailNo'] = entity.brandDetailNo;
	data['isTop'] = entity.isTop;
	data['activityTypeStr'] = entity.activityTypeStr;
	data['templateNo'] = entity.templateNo;
	data['proNo'] = entity.proNo;
	data['ifActivity'] = entity.ifActivity;
	return data;
}