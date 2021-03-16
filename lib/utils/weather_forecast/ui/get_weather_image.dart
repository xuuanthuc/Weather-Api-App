import 'package:flutter/cupertino.dart';

Widget getWeatherImage(String weatherType) {
  switch (weatherType) {
    case 'Clear':
      {
        return Image.asset('assets/images/clear_am.png');
      }
      break;
    case 'Clouds':
      {
        return Image.asset('assets/images/clouds_am.png');
      }
      break;
    case 'Rain':
      {
        return Image.asset('assets/images/rain.png');
      }
      break;
    case 'Snow':
      {
        return Image.asset('assets/images/snow.png');
      }
      break;
    case 'Smoke':
      {
        return Image.asset('assets/images/smoke.png');
      }
      break;
    default: {
      return Image.asset('assets/images/smoke.png');
    }
    break;
  }
}
