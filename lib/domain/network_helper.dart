import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather/domain/weather.dart';

class NetworkHelper {
  static Future<Weather> getData({required String url}) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = Weather.fromJson(json);
      return data;
    } else {
      log("errpoor");
      return Weather(
          location: "",
          description: "",
          humidity: 0,
          speed: 0,
          windDeg: 0,
          clouds: 0,
          pressure: 0,
          seaLeval: 0);
    }
  }
}
