import 'package:geekshop/generated/json/base/json_convert_content.dart';
import 'package:geekshop/models/user_detail_entity.dart';

UserDetailEntity $UserDetailEntityFromJson(Map<String, dynamic> json) {
	final UserDetailEntity userDetailEntity = UserDetailEntity();
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		userDetailEntity.msg = msg;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userDetailEntity.code = code;
	}
	final UserDetailData? data = jsonConvert.convert<UserDetailData>(json['data']);
	if (data != null) {
		userDetailEntity.data = data;
	}
	return userDetailEntity;
}

Map<String, dynamic> $UserDetailEntityToJson(UserDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['data'] = entity.data?.toJson();
	return data;
}

UserDetailData $UserDetailDataFromJson(Map<String, dynamic> json) {
	final UserDetailData userDetailData = UserDetailData();
	final dynamic? searchValue = jsonConvert.convert<dynamic>(json['searchValue']);
	if (searchValue != null) {
		userDetailData.searchValue = searchValue;
	}
	final String? createBy = jsonConvert.convert<String>(json['createBy']);
	if (createBy != null) {
		userDetailData.createBy = createBy;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		userDetailData.createTime = createTime;
	}
	final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
	if (updateBy != null) {
		userDetailData.updateBy = updateBy;
	}
	final dynamic? updateTime = jsonConvert.convert<dynamic>(json['updateTime']);
	if (updateTime != null) {
		userDetailData.updateTime = updateTime;
	}
	final dynamic? remark = jsonConvert.convert<dynamic>(json['remark']);
	if (remark != null) {
		userDetailData.remark = remark;
	}
	final UserDetailDataParams? params = jsonConvert.convert<UserDetailDataParams>(json['params']);
	if (params != null) {
		userDetailData.params = params;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userDetailData.id = id;
	}
	final String? portrait = jsonConvert.convert<String>(json['portrait']);
	if (portrait != null) {
		userDetailData.portrait = portrait;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userDetailData.nickname = nickname;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userDetailData.phone = phone;
	}
	final dynamic? blockAddress = jsonConvert.convert<dynamic>(json['blockAddress']);
	if (blockAddress != null) {
		userDetailData.blockAddress = blockAddress;
	}
	final int? registerTime = jsonConvert.convert<int>(json['registerTime']);
	if (registerTime != null) {
		userDetailData.registerTime = registerTime;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		userDetailData.type = type;
	}
	final String? verifiedState = jsonConvert.convert<String>(json['verifiedState']);
	if (verifiedState != null) {
		userDetailData.verifiedState = verifiedState;
	}
	final dynamic? tags = jsonConvert.convert<dynamic>(json['tags']);
	if (tags != null) {
		userDetailData.tags = tags;
	}
	return userDetailData;
}

Map<String, dynamic> $UserDetailDataToJson(UserDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['searchValue'] = entity.searchValue;
	data['createBy'] = entity.createBy;
	data['createTime'] = entity.createTime;
	data['updateBy'] = entity.updateBy;
	data['updateTime'] = entity.updateTime;
	data['remark'] = entity.remark;
	data['params'] = entity.params?.toJson();
	data['id'] = entity.id;
	data['portrait'] = entity.portrait;
	data['nickname'] = entity.nickname;
	data['phone'] = entity.phone;
	data['blockAddress'] = entity.blockAddress;
	data['registerTime'] = entity.registerTime;
	data['type'] = entity.type;
	data['verifiedState'] = entity.verifiedState;
	data['tags'] = entity.tags;
	return data;
}

UserDetailDataParams $UserDetailDataParamsFromJson(Map<String, dynamic> json) {
	final UserDetailDataParams userDetailDataParams = UserDetailDataParams();
	return userDetailDataParams;
}

Map<String, dynamic> $UserDetailDataParamsToJson(UserDetailDataParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}