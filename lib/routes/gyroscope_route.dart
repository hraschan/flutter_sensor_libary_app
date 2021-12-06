import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';

class GyroscopeRoute extends StatelessWidget {
  const GyroscopeRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    const space = 20.0;
    //TODO will be replaced by own library 
    const gyroX = -12;
    const gyroY = 20;
    const gyroZ = -15;

    const tableBorder = TableBorder(
        horizontalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid),
        verticalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid));

    var tablePadding = const EdgeInsets.all(15.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gyroscope"),
      ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GridView.count(crossAxisCount: 1, children: [
              Column(children: [
                const SizedBox(height: space),
                Table(
                  border: tableBorder,
                  children: [
                    TableRow(
                        decoration: const BoxDecoration(color: AccentWhite),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('X-Wert',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Y-Wert',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Z-Wert',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(color: AccentWhite),
                        children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: tablePadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'X: ' + gyroX.toString(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: tablePadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Y: ' + gyroY.toString(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: tablePadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Z: ' + gyroZ.toString(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ],
                ),
              ])
            ])));
  }
}
