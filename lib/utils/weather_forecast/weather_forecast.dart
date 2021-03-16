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
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff100f14),
        ),
        child: ListView(
          children: [
            FutureBuilder(
              future: getWeatherData,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Column(
                    children: [
                      Container(
                        child: midView(context, snapshot),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xfffcdd73)),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            textFieldView(),
          ],
        ),
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfffcdd73)),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Enter city name",
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            focusColor: Color(0xfffcdd73),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          cursorColor: Colors.white,
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              print(_cityName);
              getWeatherData = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      NetWork().getWeatherForecast(cityName: _cityName);
}
