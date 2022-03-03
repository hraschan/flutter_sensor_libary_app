import 'package:flutter/material.dart';
// import 'package:sensor_libary_test_app/widgets/coming_soon_info_widget.dart';
import 'package:sensor_library/models/raw_sensors/light_sensor.dart';

class LightsensorRoute extends StatefulWidget {
  const LightsensorRoute({Key? key}) : super(key: key);

  @override
  _LightsensorRouteState createState() => _LightsensorRouteState();
}

class _LightsensorRouteState extends State<LightsensorRoute> {
  int lightValue = 0;
  double liDoub = 0;

  @override
  void initState() {
    super.initState();

    LightSensor lightSensor = LightSensor(inMillis: 500);
    lightSensor.getRawWithoutTimeLimit().listen((event) {
      if (mounted) {
        setState(() => {lightValue = event, liDoub = lightValue.toDouble()});
        // doubleState(() => {liDoub = event as double);
        // print(lightValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lightsensor'),
        ),
        body: Text(
          'Sensor Value: $lightValue',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(height: 5, fontSize: 20),
        ));
  }
}
