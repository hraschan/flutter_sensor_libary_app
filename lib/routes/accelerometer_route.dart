import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/routes/accelerometer_recording_route.dart';
import 'package:sensor_libary_test_app/widgets/record_button_widget.dart';
import 'package:sensor_library/models/raw_sensors/accelerometer.dart';
import 'package:sensor_library/models/return_types/sensor_vector_3.dart';

class AccelerometerRoute extends StatefulWidget {
  const AccelerometerRoute({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AccelerometerState();
}

class _AccelerometerState extends State<AccelerometerRoute> {
  double accelerometerX = 0.0;
  double accelerometerY = 0.0;
  double accelerometerZ = 0.0;
  double bounce = 0.6;
  double xSpeed = 2;
  double ySpeed = 2;
  double movementX = 0.0;
  double movementY = 0.0;
  double movementZ = 0.0;
  double positionX = 0.0;
  double positionY = 0.0;

  String path = 'assets/images/ball.png';

  @override
  void initState() {
    super.initState();
    Accelerometer acc = Accelerometer(inMillis: 20);
    acc.getRaw().listen((SensorVector3 data) {
      _onAccelero(data);
    });
  }

  void _onAccelero(SensorVector3 element) {
    double newAccelerometerX = element.x;
    double newAccelerometerY = element.y;
    double newAccelerometerZ = element.z;
    setState(() {
      accelerometerX = -newAccelerometerX;
      accelerometerY = newAccelerometerY;
      accelerometerZ = newAccelerometerZ;

      if (movementY > 205 && accelerometerY > 0 ||
          movementY < -205 && accelerometerY < 0) {
        ySpeed *= -bounce;
      } else {
        ySpeed = 2;
      }
      if (movementX > 145 && accelerometerX > 0 ||
          movementX < -145 && accelerometerX < 0) {
        xSpeed *= -bounce;
      } else {
        xSpeed = 2;
      }
      movementX += accelerometerX * xSpeed;
      movementY += accelerometerY * ySpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Accelerometer"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const RecordButtonWidget(route: AccelerometerRecordingRoute()),
            Container(
              color: Colors.blueGrey[300],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 0,
                        minWidth: 0,
                        maxHeight: 235.0,
                        maxWidth: 145.0),
                    child: Transform.translate(
                      offset: Offset(movementX, movementY),
                      child: Image.asset(
                        path,
                        scale: 2,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 60,
              child: Center(
                  child: Text(
                      "x:${accelerometerX.toStringAsFixed(2)}, y:${accelerometerY.toStringAsFixed(2)} , z:${accelerometerZ.toStringAsFixed(2)}")),
            ),
          ],
        ));
  }
}
