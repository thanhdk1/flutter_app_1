import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/common/helper/constant.dart';

class JsonParser {
  JsonParser._internal();

  static final JsonParser _parser = JsonParser._internal();

  factory JsonParser() => _parser;

  List<T?>? parse<T>(dynamic json,
      {T? Function(Map<String, dynamic> data)? fromJson, String? keyParser}) {
    dynamic values = json;
    if (keyParser != null) {
      values = json[keyParser];
    }
    List<T?> list = (json[KeyParser.KEYS] as List)
        .map((e) => fromJson?.call(values[e]))
        .toList();
    return list;
  }
}
