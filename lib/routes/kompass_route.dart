import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_library/models/return_types/direction.dart';
import 'package:sensor_library/models/value_interpret/position.dart';

class KompassRoute extends StatefulWidget {
  const KompassRoute({Key? key}) : super(key: key);

  @override
  _KompassRouteState createState() => _KompassRouteState();
}

class _KompassRouteState extends State<KompassRoute> {
  late Position position;
  double direction = 0;
  String currentDirection = "...";

  @override
  void initState() {
    super.initState();

    position = Position(inMillis: 500);
    position.getCurrentHeading().forEach((element) {
      if (mounted) {
        setState(() => {direction = element});
      }
    });

    position.getCurrentDirection().forEach((element) {
      if (mounted) {
        setState(() => {currentDirection = getCurrentDirection(element)});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const pi = 3.14159265359;
    var tablePadding = const EdgeInsets.all(15.0);
    const space = 20.0;

    const tableBorder = TableBorder(
        horizontalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid),
        verticalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid));

    return Scaffold(
        backgroundColor: White,
        appBar: AppBar(
          title: const Text("Kompass"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: space * 3),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Transform.rotate(
                    angle: ((direction) * (pi / 180) * -1),
                    child: Image.asset('assets/images/compass.jpg'),
                  ),
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
                                child: const Text('Ausrichtung',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                              child: Padding(
                            padding: tablePadding,
                            child: Text(
                              currentDirection.toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: PrimaryColor),
                            ),
                          ))
                        ]),
                  ],
                ),
              ],
            )));
  }
}

String getCurrentDirection(Direction direction) {
  if (direction == Direction.north) {
    return "Norden";
  }
  if (direction == Direction.east) {
    return "Osten";
  }
  if (direction == Direction.south) {
    return "Süden";
  }
  if (direction == Direction.west) {
    return "Westen";
  }

  return "Undefined";
}
