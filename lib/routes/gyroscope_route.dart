import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';

import 'dart:async';
import 'dart:math';

map(num value, [num iStart = 0, num iEnd = pi * 2, num oStart = 0, num oEnd = 1.0]) =>
  ((oEnd - oStart) / (iEnd - iStart)) * (value - iStart) + oStart;

double _gyroX = 0;
double _gyroY = 0;
double _gyroZ = 0;

class GyroscopeRoute extends StatefulWidget{
  const GyroscopeRoute({Key? key}) : super(key: key);

  @override
  _GyroscopeRouteState createState() => _GyroscopeRouteState();
}

class _GyroscopeRouteState extends State<GyroscopeRoute> {
    //variables used for the cube
    final List<Widget> _list = <Widget>[];
    final double _size = 140.0;

    double _x = pi * 0.25, _y = pi * 0.25;
    late Timer _timer;
    int size = 0;

  @override
  Widget build(BuildContext context) {
    const space = 20.0;
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
              // Cube
              GestureDetector(
                onDoubleTap: _start,
                onPanUpdate: (DragUpdateDetails u) => setState((){
                  _x = (_x + -u.delta.dy / 150) % (pi * 2);
                  _y = (_y + -u.delta.dx / 150) % (pi * 2);
                }),
                child: Container(color: Colors.transparent, child: Cube(
                  color: Colors.grey.shade200, x: _x, y: _y, size: _size))
              ),
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
                                child: const Text('X',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Y',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Z',
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
                                    _gyroX.toString(),
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
                                    _gyroY.toString(),
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
                                    _gyroZ.toString(),
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

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  void _start(){
    if(_timer.isActive){
      return;
    }

    _timer = Timer.periodic(const Duration(milliseconds: 48), (_) => _add());
  }

  void _add(){
    if(size > 150) {
      _list.removeRange(0, Colors.accents.length * 4);
    } // Expensive, remove more at once

    setState(() => _list.add(
      Cube(x: _x, y: _y, color: Colors.accents[_timer.tick % Colors.accents.length].withOpacity(0.2), rainbow: true, size: _size)
    ));
  }
}

class Cube extends StatelessWidget{
  const Cube({Key? key, required this.x, required this.y, required this.color, required this.size, this.rainbow = false}) : super(key: key);

  static const double _shadow = 0.2, _halfPi = pi / 2, _oneHalfPi = pi + pi / 2;

  final double x, y, size;
  final Color color;
  final bool rainbow;

  double get _sum => (y + (x > pi ? pi : 0.0)).abs() % (pi * 2);

  @override
  Widget build(BuildContext context){
    final bool _topBottom = x < _halfPi || x > _oneHalfPi;
    final bool _northSouth = _sum < _halfPi || _sum > _oneHalfPi;
    final bool _eastWest = _sum < pi;

    return Stack(children: <Widget>[
      _side(zRot: y, xRot: -x, shadow: _getShadow(x), moveZ: _topBottom),
      _side(yRot: y, xRot: _halfPi - x, shadow: _getShadow(_sum), moveZ: _northSouth),
      _side(yRot: -_halfPi + y, xRot: _halfPi - x, shadow: _shadow - _getShadow(_sum), moveZ: _eastWest)
    ]);
  }

  double _getShadow(double r){
    if(r < _halfPi){
      return map(r, 0, _halfPi, 0, _shadow);
    }else if(r > _oneHalfPi){
      return _shadow - map(r, _oneHalfPi, pi * 2, 0, _shadow);
    }else if(r < pi){
      return _shadow - map(r, _halfPi, pi, 0, _shadow);
    }

    return map(r, pi, _oneHalfPi, 0, _shadow);
  }

  Widget _side({bool moveZ = false, double xRot = 0.0, double yRot = 0.0, double zRot = 0.0, double shadow = 0.0}){
    _gyroX = xRot;
    _gyroY = yRot;
    _gyroZ = zRot;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(xRot)..rotateY(yRot)..rotateZ(zRot)
        ..translate(0.0, 0.0, moveZ ? -size / 2 : size / 2),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.expand(width: size, height: size),
          color: color,
          foregroundDecoration: BoxDecoration(color: Colors.black.withOpacity(rainbow ? 0.0 : shadow),
          border: Border.all(width: 0.8, color: rainbow ? color.withOpacity(0.3) : Colors.black26))
        )
      )
    );
  }
}