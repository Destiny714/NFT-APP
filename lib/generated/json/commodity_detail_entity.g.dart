import 'package:geekshop/generated/json/base/json_convert_content.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';

CommodityDetailEntity $CommodityDetailEntityFromJson(Map<String, dynamic> json) {
	final CommodityDetailEntity commodityDetailEntity = CommodityDetailEntity();
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		commodityDetailEntity.msg = msg;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		commodityDetailEntity.code = code;
	}
	final CommodityDetailData? data = jsonConvert.convert<CommodityDetailData>(json['data']);
	if (data != null) {
		commodityDetailEntity.data = data;
	}
	return commodityDetailEntity;
}

Map<String, dynamic> $CommodityDetailEntityToJson(CommodityDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['data'] = entity.data?.toJson();
	return data;
}

CommodityDetailData $CommodityDetailDataFromJson(Map<String, dynamic> json) {
	final CommodityDetailData commodityDetailData = CommodityDetailData();
	final dynamic? searchValue = jsonConvert.convert<dynamic>(json['searchValue']);
	if (searchValue != null) {
		commodityDetailData.searchValue = searchValue;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		commodityDetailData.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		commodityDetailData.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		commodityDetailData.updateBy = updateBy;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		commodityDetailData.updateTime = updateTime;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		commodityDetailData.remark = remark;
	}
	final CommodityDetailDataParams? params = jsonConvert.convert<CommodityDetailDataParams>(json['params']);
	if (params != null) {
		commodityDetailData.params = params;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		commodityDetailData.id = id;
	}
	final int? creatorId = jsonConvert.convert<int>(json['creatorId']);
	if (creatorId != null) {
		commodityDetailData.creatorId = creatorId;
	}
	final int? debutedTime = jsonConvert.convert<int>(json['debutedTime']);
	if (debutedTime != null) {
		commodityDetailData.debutedTime = debutedTime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		commodityDetailData.name = name;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		commodityDetailData.cover = cover;
	}
	final String? resume = jsonConvert.convert<String>(json['resume']);
	if (resume != null) {
		commodityDetailData.resume = resume;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		commodityDetailData.price = price;
	}
	final int? stock = jsonConvert.convert<int>(json['stock']);
	if (stock != null) {
		commodityDetailData.stock = stock;
	}
	final String? details = jsonConvert.convert<String>(json['details']);
	if (details != null) {
		commodityDetailData.details = details;
	}
	final int? saleMode = jsonConvert.convert<int>(json['saleMode']);
	if (saleMode != null) {
		commodityDetailData.saleMode = saleMode;
	}
	final dynamic? saleTime = jsonConvert.convert<dynamic>(json['saleTime']);
	if (saleTime != null) {
		commodityDetailData.saleTime = saleTime;
	}
	final dynamic? offShelvesTime = jsonConvert.convert<dynamic>(json['offShelvesTime']);
	if (offShelvesTime != null) {
		commodityDetailData.offShelvesTime = offShelvesTime;
	}
	final int? state = jsonConvert.convert<int>(json['state']);
	if (state != null) {
		commodityDetailData.state = state;
	}
	return commodityDetailData;
}

Map<String, dynamic> $CommodityDetailDataToJson(CommodityDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['searchValue'] = entity.searchValue;
	data['createBy'] = entity.createBy;
	data['createTime'] = entity.createTime;
	data['updateBy'] = entity.updateBy;
	data['updateTime'] = entity.updateTime;
	data['remark'] = entity.remark;
	data['params'] = entity.params?.toJson();
	data['id'] = entity.id;
	data['creatorId'] = entity.creatorId;
	data['debutedTime'] = entity.debutedTime;
	data['name'] = entity.name;
	data['cover'] = entity.cover;
	data['resume'] = entity.resume;
	data['price'] = entity.price;
	data['stock'] = entity.stock;
	data['details'] = entity.details;
	data['saleMode'] = entity.saleMode;
	data['saleTime'] = entity.saleTime;
	data['offShelvesTime'] = entity.offShelvesTime;
	data['state'] = entity.state;
	return data;
}

CommodityDetailDataParams $CommodityDetailDataParamsFromJson(Map<String, dynamic> json) {
	final CommodityDetailDataParams commodityDetailDataParams = CommodityDetailDataParams();
	return commodityDetailDataParams;
}

Map<String, dynamic> $CommodityDetailDataParamsToJson(CommodityDetailDataParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}