import 'package:geekshop/generated/json/base/json_convert_content.dart';
import 'package:geekshop/models/sub_commodity_entity.dart';

SubCommodityEntity $SubCommodityEntityFromJson(Map<String, dynamic> json) {
	final SubCommodityEntity subCommodityEntity = SubCommodityEntity();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		subCommodityEntity.total = total;
	}
	final List<SubCommodityRows>? rows = jsonConvert.convertListNotNull<SubCommodityRows>(json['rows']);
	if (rows != null) {
		subCommodityEntity.rows = rows;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		subCommodityEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		subCommodityEntity.msg = msg;
	}
	return subCommodityEntity;
}

Map<String, dynamic> $SubCommodityEntityToJson(SubCommodityEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['rows'] =  entity.rows?.map((v) => v.toJson()).toList();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	return data;
}

SubCommodityRows $SubCommodityRowsFromJson(Map<String, dynamic> json) {
	final SubCommodityRows subCommodityRows = SubCommodityRows();
	final dynamic? searchValue = jsonConvert.convert<dynamic>(json['searchValue']);
	if (searchValue != null) {
		subCommodityRows.searchValue = searchValue;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		subCommodityRows.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		subCommodityRows.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		subCommodityRows.updateBy = updateBy;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		subCommodityRows.updateTime = updateTime;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		subCommodityRows.remark = remark;
	}
	final SubCommodityRowsParams? params = jsonConvert.convert<SubCommodityRowsParams>(json['params']);
	if (params != null) {
		subCommodityRows.params = params;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		subCommodityRows.id = id;
	}
	final int? commodityId = jsonConvert.convert<int>(json['commodityId']);
	if (commodityId != null) {
		subCommodityRows.commodityId = commodityId;
	}
	final String? blockchainAddress = jsonConvert.convert<String>(json['blockchainAddress']);
	if (blockchainAddress != null) {
		subCommodityRows.blockchainAddress = blockchainAddress;
	}
	final String? holder = jsonConvert.convert<String>(json['holder']);
	if (holder != null) {
		subCommodityRows.holder = holder;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		subCommodityRows.cover = cover;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		subCommodityRows.price = price;
	}
	final int? stock = jsonConvert.convert<int>(json['stock']);
	if (stock != null) {
		subCommodityRows.stock = stock;
	}
	return subCommodityRows;
}

Map<String, dynamic> $SubCommodityRowsToJson(SubCommodityRows entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['searchValue'] = entity.searchValue;
	data['createBy'] = entity.createBy;
	data['createTime'] = entity.createTime;
	data['updateBy'] = entity.updateBy;
	data['updateTime'] = entity.updateTime;
	data['remark'] = entity.remark;
	data['params'] = entity.params?.toJson();
	data['id'] = entity.id;
	data['commodityId'] = entity.commodityId;
	data['blockchainAddress'] = entity.blockchainAddress;
	data['holder'] = entity.holder;
	data['cover'] = entity.cover;
	data['price'] = entity.price;
	data['stock'] = entity.stock;
	return data;
}

SubCommodityRowsParams $SubCommodityRowsParamsFromJson(Map<String, dynamic> json) {
	final SubCommodityRowsParams subCommodityRowsParams = SubCommodityRowsParams();
	return subCommodityRowsParams;
}

Map<String, dynamic> $SubCommodityRowsParamsToJson(SubCommodityRowsParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}