import 'package:dio/dio.dart';
import 'package:get/get.dart' as gt;

class DioInterceptor extends Interceptor {
  DioInterceptor();

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    RequestOptions options = err.requestOptions;
    print(err.response?.data);
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map data = response.data;
    if (data['code'] == 401) {
      gt.Get.offAllNamed('/login');
      return;
    }
    super.onResponse(response, handler);
  }
}
