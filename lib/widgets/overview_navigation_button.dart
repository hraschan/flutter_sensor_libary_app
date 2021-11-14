import 'package:flutter/material.dart';

class OverviewNavigationButton extends StatelessWidget {
  OverviewNavigationButton(
      {required this.title,
      required this.pageRoute,
      this.icon = const Icon(Icons.query_stats)});

  final String title;
  final Icon icon;
  final MaterialPageRoute pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
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
            icon,
            Text(title),
          ],
        ),
        onPressed: () {
          Navigator.push(context, pageRoute);
        },
      ),
    );
  }
}
