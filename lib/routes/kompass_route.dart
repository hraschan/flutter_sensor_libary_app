import 'package:flutter/material.dart';

class KompassRoute extends StatefulWidget {
  const KompassRoute({Key? key}) : super(key: key);

 
  @override
  _KompassRouteState createState() => _KompassRouteState();
}

class _KompassRouteState extends State<KompassRoute> {

  @override
  Widget build(BuildContext context) {
    const pi = 3.14159265359;
    var direction = 45; 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kompass"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Transform.rotate(angle: ((direction) * (pi / 180) * -1),
        child: Image.asset('assets/images/compass.jpg'),
      ),
    ));
  }
}
