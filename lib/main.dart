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
import 'package:sensor_libary_test_app/widgets/overview_navigation_button.dart';
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
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(widget.title),
                  backgroundColor: Theme.of(context).backgroundColor,
                  titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                body: TabBarView(children: [
                  GridView.count(
                    crossAxisCount: 2,
                    children: [
                      OverviewNavigationButton(
                        title: 'Kompass',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const KompassRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Proximitiy',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const ProximitiyRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Barometer',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const BarometerRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Accelerometer',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const AccelerometerRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Geolocator',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const GeolocatorRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Gyroscope',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const GyroscopeRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Lightsensor',
                        icon: const Icon(Icons.compass_calibration),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const LightsensorRoute()),
                      ),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    children: [
                      OverviewNavigationButton(
                        title: 'Wetter App',
                        icon: const Icon(Icons.water_damage),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const WeatherRoute()),
                      ),
                      OverviewNavigationButton(
                        title: 'Ball in the bowl',
                        icon: const Icon(Icons.sports_volleyball),
                        pageRoute: MaterialPageRoute(
                            builder: (context) => const BallInTheBowlRoute()),
                      ),
                    ],
                  ),
                ]))));
  }
}
