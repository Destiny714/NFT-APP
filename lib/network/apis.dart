import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:geekshop/models/commodity_detail_entity.dart';
import '../models/commodity_list_entity.dart';
import '../models/sub_commodity_entity.dart';
import '../models/user_detail_entity.dart';
import '../resources/models.dart';
import '../resources/prefs.dart';
import '../utils/toast.dart';
import 'dio_seal/dio_intercepter.dart';
import 'urls.dart';

Dio initDio({String? auth, bool proxy = false, String? base}) {
  Dio dio = Dio();
  if (proxy) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return 'PROXY 192.168.0.137:6666';
      };
      return null;
    };
  }
  dio.options.headers = {
    'Authorization': token,
    'Content-Type': 'application/json',
    'Accept-Language': 'zh-cn',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept': '*/*',
    'Connection': 'keep-alive',
  };
  if (base != null) {
    dio.options.baseUrl = base;
  }
  dio.options.connectTimeout = 2000;
  dio.options.sendTimeout = 2000;
  dio.options.receiveTimeout = 2000;
  dio.interceptors.add(DioInterceptor());
  return dio;
}

Future<bool> sendMessage(String phoneNumber) async {
  var dio = initDio(base: localUrl);
  Map data = {
    "clientType": "",
    "code": "",
    "phone": phoneNumber,
  };
  Response result = await dio.post('/app/user/sendCode', data: data);
  return result.data['code'] == 200;
}

Future<bool> registerAndSendMessage(String phoneNumber) async {
  var dio = initDio(base: localUrl);
  Map data = {
    "clientType": "",
    "code": "",
    "phone": phoneNumber,
  };
  Response result = await dio.post('/app/user/register', data: data);
  return result.data['code'] == 200;
}

Future<bool> login(
    {required String phoneNumber, required String msgCode}) async {
  var dio = initDio(base: localUrl);
  Map data = {
    "clientType": "",
    "code": msgCode,
    "phone": phoneNumber,
  };
  Response result = await dio.post('/app/user/login', data: data);
  int code = result.data['code'];
  String msg = result.data['msg'];
  if (code != 200) {
    showToast(msg);
  } else {
    token = result.data['token'];
  }
  return code == 200;
}

Future updateUserDetail() async {
  var dio = initDio(base: localUrl);
  Response result = await dio.get('/app/user/info');
  UserDetailEntity entity = UserDetailEntity.fromJson(result.data);
  int code = entity.code!;
  if (code != 200) {
    userDetailData = null;
    if (token != '') {
      token = '';
    }
  } else {
    userDetailData = entity.data;
  }
}

Future<List<CommodityListRows>?> getCommodityList() async {
  var dio = initDio(base: localUrl);
  Response result = await dio.get('/app/commodity/list');
  CommodityListEntity entity = CommodityListEntity.fromJson(result.data);
  return entity.rows;
}

Future<List<SubCommodityRows>?> getSubCommodityList(int id) async {
  var dio = initDio(base: localUrl);
  Response result = await dio.get('/app/commodity/sub/list/$id');
  SubCommodityEntity entity = SubCommodityEntity.fromJson(result.data);
  return entity.code == 200 ? entity.rows : null;
}

Future<CommodityDetailData?> getCommodityDetail(int id) async {
  var dio = initDio(base: localUrl);
  Response result = await dio.get('/app/commodity/$id');
  CommodityDetailEntity entity = CommodityDetailEntity.fromJson(result.data);
  return entity.data;
}

Future<String?> createOrder(int id) async {
  var dio = initDio(base: localUrl);
  Map data = {"commodityId": id, "type": 0};
  Response result = await dio.post('/app/order/createOrder', data: data);
  Map res = result.data;
  if (res['code'] == 200) {
    return null;
  } else {
    return res['msg'];
  }
}

Future<bool> realNameVerify({
  required String name,
  required String idCard,
}) async {
  var dio = initDio(base: localUrl);
  Map data = {
    "fullName": name,
    "idcard": idCard,
  };
  Response result = await dio.post('/app/user/certification', data: data);
  if (result.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
