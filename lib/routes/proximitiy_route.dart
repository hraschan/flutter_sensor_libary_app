import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/routes/proximity_recording_route.dart';
import 'package:sensor_libary_test_app/widgets/record_button_widget.dart';

class ProximitiyRoute extends StatelessWidget {
  const ProximitiyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proximitiy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: const [
            RecordButtonWidget(route: ProximityRecordingRoute())
          ],
        ),
      ),
    );
  }
}
