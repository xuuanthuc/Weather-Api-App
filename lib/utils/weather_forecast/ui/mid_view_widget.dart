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
  var humidity = snapshot.data.main.humidity;
  var wind = snapshot.data.wind.speed;
  var long = snapshot.data.coord.lon;
  var lat = snapshot.data.coord.lat;
  var visi = snapshot.data.visibility/1000;


  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 30, bottom: 20),
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
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
                color: Colors.white24,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                formText('assets/images/wind_solid.svg','${wind}km/h', 'Wind'),
                formText('assets/images/humi_solid.svg','${humidity}%', 'Humidity', ),
                formText('assets/images/visi_solid.svg','${visi.toStringAsFixed(0)}km', 'Visibility',),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget formText( String svgAssets,String value,String label,) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 20,
        height: 20,
        child:SvgPicture.asset(svgAssets, color: Colors.white,fit: BoxFit.fill,),
      ),
      SizedBox(
        height: 5,
      ),
      Text(value, style: TextStyle(color: Colors.white),),
      SizedBox(
        height: 5,
      ),
      Text(label, style: TextStyle(color: Colors.white54),),
    ],
  );
}
