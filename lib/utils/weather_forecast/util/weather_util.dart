import 'package:intl/intl.dart';
import 'package:sunrise_sunset/sunrise_sunset.dart';

class Util{
  static String appId="0f6bf011e0c20a3f0f382979628521e5";
  static String getFormatDate(DateTime dateTime){
      return DateFormat("d, MMM y").format(dateTime);
  }
}

