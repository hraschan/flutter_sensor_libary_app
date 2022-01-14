import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';

class RecordButtonWidget extends StatefulWidget {
  final dynamic route;

  const RecordButtonWidget({required this.route, Key? key}) : super(key: key);

  @override
  RecordButtonWidgetState createState() => RecordButtonWidgetState();
}

class RecordButtonWidgetState extends State<RecordButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: (Padding(
            padding: const EdgeInsets.all(5.00),
            child: TextButton.icon(
                style: TextButton.styleFrom(
                    backgroundColor: PrimaryColor, primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => widget.route));
                },
                icon: const Icon(
                  Icons.play_arrow,
                  size: 25.0,
                  color: White,
                ),
                label: Text("Recordings".toUpperCase())))));
  }
}
