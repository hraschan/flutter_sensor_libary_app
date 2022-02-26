import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_library/models/value_interpret/movement.dart';

class AccelerometerRecordingRoute extends StatefulWidget {
  const AccelerometerRecordingRoute({Key? key}) : super(key: key);

  @override
  _AccelerometerRecordingState createState() => _AccelerometerRecordingState();
}

class _AccelerometerRecordingState extends State<AccelerometerRecordingRoute> {
  late Movement movement;
  int milisec = 500;

  Timer? timer;

  var startButtonText = "Start Recording";

  var minAcc = "...";
  var maxAcc = "...";
  var averageAcc = "...";

  var records = <TableRow>[];

  static const headingStyle = TextStyle(fontWeight: FontWeight.bold);

  static const tableBorder = TableBorder(
      horizontalInside:
          BorderSide(width: 2, color: Background, style: BorderStyle.solid),
      verticalInside:
          BorderSide(width: 2, color: Background, style: BorderStyle.solid));

  var tablePadding = const EdgeInsets.all(15.0);

  @override
  void initState() {
    super.initState();
    movement = Movement(inMillis: milisec);
  }

  void _startRecording() {
    print("START");

    setState(() {
      records = <TableRow>[];
    });

    movement.startTracking(milisec);

    timer = Timer.periodic(
        Duration(milliseconds: milisec), (Timer t) => updateRecordTable());
  }

  void _stopRecording() {
    print("STOP");
    var minValue = movement.getMinAcceleration();
    var maxValue = movement.getMaxAcceleration();
    var averageValue = movement.getAvgAcceleration();

    setState(() {
      minAcc = minValue.value.toString();
      maxAcc = maxValue.value.toString();
      averageAcc = averageValue.value.toString();
    });

    timer?.cancel();

    startButtonText = "RESTART Recording";
    // movement.stopTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Accelerometer Recording"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(children: [
                      ElevatedButton(
                        onPressed: () {
                          _startRecording();
                        },
                        child: Text(startButtonText),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          _stopRecording();
                        },
                        child: const Text('STOP Recording'),
                      )
                    ]),
                    const SizedBox(height: 20),
                    Table(
                      border: tableBorder,
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(color: AccentWhite),
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text('Min'.toUpperCase(),
                                          style: headingStyle))),
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text(minAcc)))
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(color: AccentWhite),
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text("Max".toUpperCase(),
                                          style: headingStyle))),
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text(maxAcc)))
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(color: AccentWhite),
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text("Average".toUpperCase(),
                                          style: headingStyle))),
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text(averageAcc)))
                            ])
                      ],
                    ),
                    const SizedBox(height: 20),
                    Table(
                      border: tableBorder,
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(color: AccentWhite),
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text("TimeStamp".toUpperCase(),
                                          style: headingStyle))),
                              TableCell(
                                  child: Padding(
                                      padding: tablePadding,
                                      child: Text("Value".toUpperCase(),
                                          style: headingStyle)))
                            ]),
                        ...records
                      ],
                    )
                  ],
                ))));
  }

  updateRecordTable() {
    var now = DateTime.now();
    var data = movement.getAccelerationAtTimestamp(now);

    var newRecord = TableRow(
        decoration: const BoxDecoration(color: AccentWhite),
        children: [
          TableCell(
              child:
                  Padding(padding: tablePadding, child: Text(now.toString()))),
          TableCell(
              child: Padding(
                  padding: tablePadding, child: Text(data.value.toString())))
        ]);

    var updatedRecors = records;
    updatedRecors.add(newRecord);

    setState(() {
      records = updatedRecors;
    });
  }
}
