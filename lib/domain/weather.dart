import 'package:weather/domain/network_helper.dart';

import 'package:http/http.dart' as http;

class Weather {
  final String location;
  final String description;
  final int humidity;
  final double speed;
  final int windDeg;
  final int clouds;
  final int pressure;
  final int seaLeval;

  Weather(
      {required this.location,
      required this.description,
      required this.humidity,
      required this.speed,
      required this.windDeg,
      required this.clouds,
      required this.pressure,
      required this.seaLeval});

  static fromJson(Map<String, dynamic> json) {
    return Weather(
        location: json["name"],
        description: json["weather"][0]["description"],
        humidity: json["main"]["humidity"],
        speed: json["wind"]["speed"],
        windDeg: json["wind"]["deg"],
        clouds: json["clouds"]["all"],
        pressure: json["main"]["pressure"],
        seaLeval: json["main"]["sea_level"]);
  }

  static Future<Weather> getCurretLocation(
      {required double latitude, required double logitude}) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$logitude&appid=3ff3389b6a678ac5012b9b1c8c6843a3&units=metric";

    final data = NetworkHelper.getData(url: url);
    return data;
  }

  static Future<Weather> searchCity({required String city}) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=3ff3389b6a678ac5012b9b1c8c6843a3&units=metric";
    final data = NetworkHelper.getData(url: url);
    return data;
  }
}
