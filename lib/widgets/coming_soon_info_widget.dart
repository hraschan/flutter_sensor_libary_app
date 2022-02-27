import 'package:flutter/material.dart';

class ComingSoonInfoWidget extends StatefulWidget {
  const ComingSoonInfoWidget({Key? key}) : super(key: key);

  @override
  ComingSoonInfoWidgetState createState() => ComingSoonInfoWidgetState();
}

class ComingSoonInfoWidgetState extends State<ComingSoonInfoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Coming soon!".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
