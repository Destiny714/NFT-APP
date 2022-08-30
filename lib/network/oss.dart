import 'package:aliyun_oss_flutter/aliyun_oss_flutter.dart';
import 'package:geekshop/resources/models.dart';

const _bucket = 'geekshop-test-env';
const _endPoint = 'oss-cn-hangzhou.aliyuncs.com';

void initOSS(){
  ossClient = OSSClient.init(
    endpoint: _endPoint,
    bucket: _bucket,
    credentials: () async {
      return Credentials(
        accessKeyId: '',
        accessKeySecret: '',
      );
    },
  );
}

Future<String> uploadOSS(OSSObject objectOSS) async {
  final object = await ossClient.putObject(
    bucket: _bucket,
    endpoint: _endPoint,
    object: objectOSS,
  );
  return object.url;
}