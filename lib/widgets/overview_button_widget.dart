import 'package:flutter/material.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';

class OverviewButtonWidget extends StatefulWidget {
  final String title;
  final dynamic route;
  final IconData? iconData;

  const OverviewButtonWidget(
      {required this.title, required this.route, this.iconData, Key? key})
      : super(key: key);

  @override
  OverviewButtonWidgetState createState() => OverviewButtonWidgetState();
}

class OverviewButtonWidgetState extends State<OverviewButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var iconData = Icons.sensors;
    if (widget.iconData != null) {
      iconData = widget.iconData!;
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AccentWhite),
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  iconData,
                  size: 50.0,
                  color: SecondaryColor,
                )),
            Text(widget.title.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget.route));
        },
      ),
    );
  }
}
