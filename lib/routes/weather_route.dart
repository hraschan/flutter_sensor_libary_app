import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_library/models/raw_sensors/temperature.dart';
import 'package:weather_icons/weather_icons.dart';

enum WeatherState {
  undefined,
  sonnig,
  wechselhaft,
  bedeckt,
  regenschauer,
  regen,
  gewitter,
  schneefall
}

class WeatherRoute extends StatefulWidget {
  const WeatherRoute({Key? key}) : super(key: key);

  @override
  _WeatherRouteState createState() => _WeatherRouteState();
}

class _WeatherRouteState extends State<WeatherRoute> {
  var space = 25.0;
  var now = getCurrentDateTime();
  var location = 'Wien';
  var currentWeatherState = WeatherState.schneefall;
  double feelingTemperature = 0;
  var airPressure = 998;
  double temperature = 0;
  // var currentWeatherString = getCurrentWeatherString(currentWeatherState);
  var currentWeather = getCurrentWeather(state: WeatherState.schneefall);

  late Temperature temp;

  @override
  void initState() {
    super.initState();

    temp = Temperature(inMillis: 500);
    temp.getRaw().listen((element) {
      double value = element;

      setStateIfMounted(() {
        temperature = value;
        feelingTemperature = value;
        currentWeather = getCurrentWeather(state: currentWeatherState);
      });
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wetter"),
        ),
        body: Padding(
          padding: EdgeInsets.all(space),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(now),
              Text(location,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor,
                      fontSize: 35)),
              SizedBox(height: space),
              Container(
                color: AccentWhite,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: space / 2, right: space, bottom: space),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: space * 2),
                          child: Icon(currentWeather[1],
                              size: 100, color: SecondaryColorLight)),
                      SizedBox(width: space * 2),
                      Padding(
                          padding:
                              EdgeInsets.only(top: space * 2, bottom: space),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: space * 4),
                              Text(currentWeather[0]),
                              Text('Gefühlt wie ' +
                                  feelingTemperature.toString() +
                                  '°'),
                              Text('Luftdruck: ' + airPressure.toString()),
                              SizedBox(height: space / 2),
                              Text(temperature.toString() + '°',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: PrimaryColor,
                                      fontSize: 45))
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

String getCurrentDateTime() {
  DateTime now = DateTime.now();
  DateFormat formater = DateFormat('EEE., dd. MMMM yyyy HH:mm');
  return formater.format(now) + ' Uhr';
}

// https://erikflowers.github.io/weather-icons/
getCurrentWeather({WeatherState state = WeatherState.undefined}) {
  String string;
  IconData icon;

  switch (state) {
    case WeatherState.undefined:
      {
        string = 'undefined';
        icon = Icons.visibility_off_outlined;
      }
      break;
    case WeatherState.sonnig:
      {
        string = 'Sonnig';
        icon = WeatherIcons.day_sunny;
      }
      break;
    case WeatherState.wechselhaft:
      {
        string = 'Wechselhaft';
        icon = WeatherIcons.day_hail;
      }
      break;
    case WeatherState.bedeckt:
      {
        string = 'Bedeckt';
        icon = WeatherIcons.cloudy;
      }
      break;
    case WeatherState.regenschauer:
      {
        string = 'Regenschauer';
        icon = WeatherIcons.showers;
      }
      break;
    case WeatherState.regen:
      {
        string = 'Regen';
        icon = WeatherIcons.rain;
      }
      break;
    case WeatherState.gewitter:
      {
        string = 'Gewitter';
        icon = WeatherIcons.storm_showers;
      }
      break;
    case WeatherState.schneefall:
      {
        string = 'Schneefall';
        icon = WeatherIcons.snow;
      }
      break;
  }
  return [string, icon];
}
