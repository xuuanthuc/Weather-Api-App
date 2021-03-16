import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_api_app/utils/weather_forecast/models/weather_forecast_model.dart';
import 'package:weather_api_app/utils/weather_forecast/ui/get_weather_image.dart';
import 'package:weather_api_app/utils/weather_forecast/util/weather_util.dart';

Widget midView(
    BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
  var cityName = snapshot.data.name;
  var country = snapshot.data.sys.country;
  var dateTime = snapshot.data.dt;
  var temp = snapshot.data.main.temp;
  var tempdesc = snapshot.data.weather[0].main;
  var long = snapshot.data.coord.lon;
  var lat = snapshot.data.coord.lat;

  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Util.getFormatDate(DateTime.fromMillisecondsSinceEpoch(dateTime * 1000))}',
                    style: TextStyle(color: Color(0xffe3e3e3)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(Icons.stars, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text(
                        '${cityName.toUpperCase()}, ${country}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/map.svg',
                fit: BoxFit.fill,
                color: Color(0xff29292b),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: getWeatherImage(tempdesc),
                ),
              ),
            ],
          ),
        ),
        Text(
          '${tempdesc}',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${temp.toStringAsFixed(0)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 92,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'º',
              style: TextStyle(color: Color(0xfffcdd73), fontSize: 72),
            ),
          ],
        )
      ],
    ),
  );
}
