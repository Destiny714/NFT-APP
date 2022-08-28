import 'models.dart';

String get token => prefs.getString('token') ?? '';

set token(String? token) => prefs.setString('token', token ?? '');
