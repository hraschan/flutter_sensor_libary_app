import 'package:flutter/material.dart';
import 'package:sensor_library/models/value_interpret/position.dart';


class KompassRoute extends StatefulWidget {
  const KompassRoute({Key? key}) : super(key: key);

 
  @override
  _KompassRouteState createState() => _KompassRouteState();
}

class _KompassRouteState extends State<KompassRoute> {

  late Position position;
  double direction = 0; 

  @override
  void initState() {
    super.initState();
    position = Position(inMillis: 500);
    position.getCurrentHeading().forEach((element) {
      if(mounted){
        setState(() => {
          direction = element,
          print(element)
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const pi = 3.14159265359;
  
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
