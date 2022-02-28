import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/widgets/coming_soon_info_widget.dart';

class BallInTheBowlRoute extends StatelessWidget {
  const BallInTheBowlRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ball in the Bowl"),
        ),
        body: const ComingSoonInfoWidget());
  }
}
