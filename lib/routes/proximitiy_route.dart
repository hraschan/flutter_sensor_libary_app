import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/routes/proximity_recording_route.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_libary_test_app/widgets/record_button_widget.dart';
import 'package:sensor_library/models/raw_sensors/proximity.dart';

class ProximitiyRoute extends StatefulWidget {
  const ProximitiyRoute({Key? key}) : super(key: key);

  @override
  _ProximitiyRouteState createState() => _ProximitiyRouteState();
}

class _ProximitiyRouteState extends State<ProximitiyRoute> {
  var currentDistance = "";
  var limit = 5;
  var currentIcon = Icons.info;

  late Proximity prox;

  @override
  void initState() {
    super.initState();

    prox = Proximity(inMillis: 500);
    prox.getRawWithoutTimelimit().listen((event) {
      var distance = "...";
      var icon = Icons.lightbulb_outlined;

      if (event == 0) {
        distance = "Größer als 1 CM";
        icon = Icons.lightbulb;
      }
      if (event == 1) {
        distance = "Weniger als 1 CM";
        icon = Icons.lightbulb_outlined;
      }

      if (mounted) {
        setState(() {
          currentDistance = distance;
          currentIcon = icon;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proximitiy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const RecordButtonWidget(route: ProximityRecordingRoute()),
            Column(
              children: [
                const SizedBox(height: 25),
                const Text("Zeigt ob ein Abstand Besteht"),
                const Text("(1 CM ist die Grenze)"),
                const SizedBox(height: 20),
                Stack(children: [
                  const Positioned(
                      child: Icon(Icons.smartphone,
                          size: 300, color: SecondaryColor)),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 1,
                      bottom: 1,
                      child: Icon(currentIcon, size: 150, color: PrimaryColor)),
                ]),
                const SizedBox(height: 20),
                const Text(
                  "Aktueller Abstand",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  currentDistance,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor,
                      fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
