import 'package:geekshop/generated/json/base/json_convert_content.dart';
import 'package:geekshop/models/commodity_list_entity.dart';

CommodityListEntity $CommodityListEntityFromJson(Map<String, dynamic> json) {
	final CommodityListEntity commodityListEntity = CommodityListEntity();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		commodityListEntity.total = total;
	}
	final List<CommodityListRows>? rows = jsonConvert.convertListNotNull<CommodityListRows>(json['rows']);
	if (rows != null) {
		commodityListEntity.rows = rows;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		commodityListEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		commodityListEntity.msg = msg;
	}
	return commodityListEntity;
}

Map<String, dynamic> $CommodityListEntityToJson(CommodityListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['rows'] =  entity.rows?.map((v) => v.toJson()).toList();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	return data;
}

CommodityListRows $CommodityListRowsFromJson(Map<String, dynamic> json) {
	final CommodityListRows commodityListRows = CommodityListRows();
	final dynamic? searchValue = jsonConvert.convert<dynamic>(json['searchValue']);
	if (searchValue != null) {
		commodityListRows.searchValue = searchValue;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		commodityListRows.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		commodityListRows.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		commodityListRows.updateBy = updateBy;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		commodityListRows.updateTime = updateTime;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		commodityListRows.remark = remark;
	}
	final CommodityListRowsParams? params = jsonConvert.convert<CommodityListRowsParams>(json['params']);
	if (params != null) {
		commodityListRows.params = params;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		commodityListRows.id = id;
	}
	final int? creatorId = jsonConvert.convert<int>(json['creatorId']);
	if (creatorId != null) {
		commodityListRows.creatorId = creatorId;
	}
	final int? debutedTime = jsonConvert.convert<int>(json['debutedTime']);
	if (debutedTime != null) {
		commodityListRows.debutedTime = debutedTime;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		commodityListRows.name = name;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		commodityListRows.cover = cover;
	}
	final String? resume = jsonConvert.convert<String>(json['resume']);
	if (resume != null) {
		commodityListRows.resume = resume;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		commodityListRows.price = price;
	}
	final int? stock = jsonConvert.convert<int>(json['stock']);
	if (stock != null) {
		commodityListRows.stock = stock;
	}
	final String? details = jsonConvert.convert<String>(json['details']);
	if (details != null) {
		commodityListRows.details = details;
	}
	final int? saleMode = jsonConvert.convert<int>(json['saleMode']);
	if (saleMode != null) {
		commodityListRows.saleMode = saleMode;
	}
	final int? saleTime = jsonConvert.convert<int>(json['saleTime']);
	if (saleTime != null) {
		commodityListRows.saleTime = saleTime;
	}
	final int? offShelvesTime = jsonConvert.convert<int>(json['offShelvesTime']);
	if (offShelvesTime != null) {
		commodityListRows.offShelvesTime = offShelvesTime;
	}
	final int? state = jsonConvert.convert<int>(json['state']);
	if (state != null) {
		commodityListRows.state = state;
	}
	return commodityListRows;
}

Map<String, dynamic> $CommodityListRowsToJson(CommodityListRows entity) {
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

CommodityListRowsParams $CommodityListRowsParamsFromJson(Map<String, dynamic> json) {
	final CommodityListRowsParams commodityListRowsParams = CommodityListRowsParams();
	return commodityListRowsParams;
}

Map<String, dynamic> $CommodityListRowsParamsToJson(CommodityListRowsParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}