import 'package:flutter/material.dart';

class OverviewButtonWidget extends StatefulWidget {
  final String title;
  final dynamic route;

  const OverviewButtonWidget(
      {required this.title, required this.route, Key? key})
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).backgroundColor),
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.compass_calibration,
                  size: 50.0,
                  color: Color(0xFF636060),
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
