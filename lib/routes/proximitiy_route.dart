import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/routes/proximity_recording_route.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_libary_test_app/widgets/record_button_widget.dart';

class ProximitiyRoute extends StatelessWidget {
  const ProximitiyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDistance = 0;
    var limit = 5;

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
                Text("Grenze: $limit CM"),
                const SizedBox(height: 20),
                Stack(children: const [
                  Positioned(
                      child: Icon(Icons.smartphone,
                          size: 300, color: SecondaryColor)),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 1,
                      bottom: 1,
                      child: Icon(Icons.lightbulb,
                          size: 150, color: PrimaryColor)),
                ]),
                const SizedBox(height: 20),
                const Text(
                  "Aktueller Abstand",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "$currentDistance CM",
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
