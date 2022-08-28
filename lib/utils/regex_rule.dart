bool regexPhoneNum(String? input) {
  if (input == null || input.isEmpty) return false;
  String regexPhoneNumber =
      "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
  return RegExp(regexPhoneNumber).hasMatch(input);
}

String? regexName(String? input) {
  if (input == null || input.isEmpty) return '姓名不能为空';
  String nameRegexRule =
      '^(([a-zA-Z+\\.?\\·?a-zA-Z+]{2,30}\$)|([\u4e00-\u9fa5+\\·?\u4e00-\u9fa5+]{2,30}\$))';
  return RegExp(nameRegexRule).hasMatch(input) ? null : '姓名格式错误';
}

String? regexIdCard(String? input) {
  if (input == null || input.isEmpty) return '身份证不能为空';
  String idRegexRule =
      '^(^[1-9]\\d{5}[1-9]\\d{3}(((0[2])([0|1|2][0-8])|(([0-1][1|4|6|9])([0|1|2][0-9]|[3][0]))|(((0[1|3|5|7|8])|(1[0|2]))(([0|1|2]\\d)|3[0-1]))))((\\d{4})|\\d{3}[Xx])\$)\$';
  return RegExp(idRegexRule).hasMatch(input) ? null : '身份证错误';
}
