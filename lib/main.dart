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
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'themes/custom_theme.dart';
import 'widgets/overview_button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'SENSOR LIBRARY DEMO APP'),
      theme: MyTheme.lightTheme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "Base Usage".toUpperCase()),
                  Tab(text: "Advanced Usage".toUpperCase())
                ],
                indicatorColor: Theme.of(context).indicatorColor,
                labelColor: Theme.of(context).indicatorColor,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Text(widget.title),
              backgroundColor: Theme.of(context).backgroundColor,
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: PrimaryColor),
              foregroundColor: Theme.of(context).primaryColor,
            ),
            body: TabBarView(children: [
              GridView.count(
                crossAxisCount: 2,
                children: const [
                  OverviewButtonWidget(
                      title: 'Compass',
                      route: KompassRoute(),
                      iconData: Icons.explore_outlined),
                  OverviewButtonWidget(
                      title: 'Proximity', // Abstand
                      route: ProximitiyRoute(),
                      iconData: Icons.swap_horiz),
                  OverviewButtonWidget(
                      title: 'Barometer', // Luftdruck
                      route: BarometerRoute(),
                      iconData: Icons.air),
                  OverviewButtonWidget(
                      title: 'Accelerometer', // Beschleunigung
                      route: AccelerometerRoute(),
                      iconData: Icons.speed),
                  OverviewButtonWidget(
                      title: 'Geolocator',
                      route: GeolocatorRoute(),
                      iconData: Icons.place),
                  OverviewButtonWidget(
                      title: 'Gyroscope',
                      route: GyroscopeRoute(),
                      iconData: Icons.view_in_ar),
                  OverviewButtonWidget(
                      title: 'Lightsensor',
                      route: LightsensorRoute(),
                      iconData: Icons.lightbulb_outline),
                ],
              ),
              GridView.count(
                crossAxisCount: 2,
                children: const [
                  OverviewButtonWidget(
                      title: 'Weather',
                      route: WeatherRoute(),
                      iconData: Icons.cloud),
                  /*OverviewButtonWidget(
                      title: 'Ball in the Bowl',
                      route: BallInTheBowlRoute(),
                      iconData: Icons.sports_volleyball)*/
                ],
              ),
            ])));
  }
}
