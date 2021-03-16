import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api_app/utils/weather_forecast/models/weather_forecast_model.dart';
import 'package:weather_api_app/utils/weather_forecast/util/weather_util.dart';

class NetWork {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl =
       "http://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${Util.appId}&units=metric";
    final response = await http.get(Uri.encodeFull(finalUrl));
    if (response.statusCode == 200) {
      //  TODO: Anh xa du lieu vao WeatherForecastModel
      print(response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body)); //giai ma tu json qua, encode la ma hoa qua json
    } else {
      throw Exception('Error get weather');
    }
  }
}
