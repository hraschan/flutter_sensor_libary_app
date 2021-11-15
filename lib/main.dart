import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/routes/accelerometer_route.dart';
import 'package:sensor_libary_test_app/routes/ball_in_the_bowl_route.dart';
import 'package:sensor_libary_test_app/routes/barometer_route.dart';
import 'package:sensor_libary_test_app/routes/geolocator_route.dart';
import 'package:sensor_libary_test_app/routes/gyroscope_route.dart';
import 'package:sensor_libary_test_app/routes/kompass_route.dart';
import 'package:sensor_libary_test_app/routes/lightsensor_route.dart';
import 'package:sensor_libary_test_app/routes/proximitiy_route.dart';
import 'package:sensor_libary_test_app/routes/weather_route.dart';
import 'package:sensor_library/sensor_library.dart';
import 'themes/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: true,
      home: const MyHomePage(title: 'SENSOR LIBRARY DEMO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Sensorbased".toUpperCase()),
                      Tab(text: "Advanced Usage".toUpperCase())
                    ],
                    indicatorColor: Theme.of(context).indicatorColor,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(widget.title),
                  backgroundColor: Theme.of(context).backgroundColor,
                  titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                body: TabBarView(children: [
                  GridView.count(
                    crossAxisCount: 2,
                    children: const [
                      _OverviewButton('Kompass', KompassRoute()),
                      _OverviewButton('Proximity', ProximitiyRoute()),
                      _OverviewButton('Barometer', BarometerRoute()),
                      _OverviewButton('Accelerometer', AccelerometerRoute()),
                      _OverviewButton('Geolocator', GeolocatorRoute()),
                      _OverviewButton('Gyroscope', GyroscopeRoute()),
                      _OverviewButton('Lightsensor', LightsensorRoute()),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    children: const [
                      _OverviewButton('Wetter App', WeatherRoute()),
                      _OverviewButton('Ball in the Bowl', BallInTheBowlRoute()),
                    ],
                  ),
                ]))));
  }
}


class _OverviewButton extends StatelessWidget {
  final String title;
  final dynamic route;

  // ignore: use_key_in_widget_constructors
  const _OverviewButton(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).backgroundColor),
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).primaryColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.compass_calibration,
                  size: 50.0,
                  color: Color(0xFF636060),
                )),
            Text(title.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      route));
        },
      ),
    );
  }
}


