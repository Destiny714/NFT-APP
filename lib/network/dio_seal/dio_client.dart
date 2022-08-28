import 'package:dio/dio.dart';

class DioClient {
  static final DioClient client = DioClient._init();

  factory DioClient() => client;

  static final CancelToken _cancelToken = CancelToken();

  Dio? _dio;

  static Map<String,dynamic> headers = {
    'Authorization': '',
    'Content-Type': 'application/json',
    'Accept-Language': 'zh-cn',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept': '*/*',
    'appId': 'wx71a6af1f91734f18',
    'Connection': 'keep-alive',
    'User-Agent':
    'Mozilla/5.0 (iPhone; CPU iPhone OS 11_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E217 MicroMessenger/6.8.0(0x16080000) NetType/WIFI Language/en Branch/Br_trunk MiniProgramEnv/Mac'
  };

  DioClient._init(){
    final BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 2000,
      headers: headers,
    );
    _dio?.options = options;
  }




}
