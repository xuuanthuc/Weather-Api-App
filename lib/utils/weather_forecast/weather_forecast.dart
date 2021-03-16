import 'package:flutter/material.dart';
import 'package:weather_api_app/utils/weather_forecast/models/weather_forecast_model.dart';
import 'package:weather_api_app/utils/weather_forecast/network/network.dart';
import 'package:weather_api_app/utils/weather_forecast/ui/mid_view_widget.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> getWeatherData;
  String _cityName = "Hanoi";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData = NetWork().getWeatherForecast(cityName: _cityName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          FutureBuilder(
            future: getWeatherData,
            builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Column(
                  children: [
                    Container(
                      height: 200,
                      child: midView(snapshot),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter city name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
             _cityName = value;
             print(_cityName);
            getWeatherData = getWeather(cityName: _cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) => NetWork().getWeatherForecast(cityName: _cityName);
}
