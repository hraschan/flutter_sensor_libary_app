import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
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
  var currentIcon = Icons.lightbulb_outline;
  var iconColor = SecondaryColor;

  @override
  void initState() {
    super.initState();

    LightSensor lightSensor = LightSensor(inMillis: 500);
    lightSensor.getRawWithoutTimeLimit().listen((event) {
      var lValue = event;
      var icon = Icons.lightbulb_outline;
      var color = SecondaryColor;

      if (lValue != 0) {
        if (lValue <= 50) {
          icon = Icons.lightbulb_outline;
          color = SecondaryColor;
        }
        if (lValue <= 1000 && lValue > 50) {
          icon = Icons.lightbulb;
          color = SecondaryColor;
        }
        if (lValue > 1000) {
          icon = Icons.lightbulb;
          color = PrimaryColor;
        }
      }

      if (mounted) {
        setState(() {
          lightValue = lValue;
          liDoub = lValue.toDouble();
          currentIcon = icon;
          iconColor = color;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const space = 20.0;
    var tablePadding = const EdgeInsets.all(15.0);

    const tableBorder = TableBorder(
        horizontalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid),
        verticalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lightsensor'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  const SizedBox(height: space * 3),
                  Container(
                    alignment: Alignment.center,
                    child: Icon(currentIcon, size: 150, color: iconColor),
                  ),
                  const SizedBox(height: space * 3),
                  Table(
                    border: tableBorder,
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Lightvalue',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                                child: Padding(
                              padding: tablePadding,
                              child: Text(
                                "$lightValue",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: PrimaryColor),
                              ),
                            ))
                          ]),
                    ],
                  ),
                ]))));
  }
}
