import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/widgets/coming_soon_info_widget.dart';

class BarometerRoute extends StatelessWidget {
  const BarometerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Barometer"),
        ),
        body: const ComingSoonInfoWidget());
  }
}
