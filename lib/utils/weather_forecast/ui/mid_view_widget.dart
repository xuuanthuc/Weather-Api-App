import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_api_app/utils/weather_forecast/models/weather_forecast_model.dart';
import 'package:weather_api_app/utils/weather_forecast/util/weather_util.dart';
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var cityName = snapshot.data.name;
  var country = snapshot.data.sys.country;
  var dateTime = snapshot.data.dt;
  var temp = snapshot.data.main.temp;
  var tempdesc = snapshot.data.weather[0].main;
  return Container(
    child: Column(
      children: [
        Text('${cityName},${country}'),
        Text('${Util.getFormatDate(DateTime.fromMillisecondsSinceEpoch(dateTime * 1000))}'),
        Text('${temp.toStringAsFixed(0)}ºC ${tempdesc}')
      ],
    ),
  );

}
