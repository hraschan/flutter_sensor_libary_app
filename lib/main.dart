import 'package:flutter/material.dart';
import 'package:sensor_library/sensor_library.dart';
import 'themes/custom_theme.dart';
import 'themes/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: true,
      home: const MyHomePage(title: 'Sensor Library Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Sensorbased".toUpperCase()),
                      Tab(text: "Advanced Usage".toUpperCase())
                    ],
                    indicatorColor: Theme.of(context).indicatorColor,
                    labelColor: Colors.black,
                  ),
                  title: Text(widget.title),
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
                body: const TabBarView(children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_bike)
                ]))));
  }
}
