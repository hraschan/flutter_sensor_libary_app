import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sensor_libary_test_app/themes/custom_colors.dart';
import 'package:sensor_library/models/raw_sensors/gps.dart';
import 'package:sensor_library/models/return_types/direction.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:sensor_library/models/value_interpret/position.dart';

class GeolocatorRoute extends StatefulWidget {
  const GeolocatorRoute({Key? key}) : super(key: key);

  @override
  _GeolocatorRouteState createState() => _GeolocatorRouteState();
}

class _GeolocatorRouteState extends State<GeolocatorRoute> {
  late LatLng currentLocation;
  // final LatLng rememberdLocation = LatLng(48.209209, 16.372780);

  var tablePadding = const EdgeInsets.all(15.0);

  late Position pos;
  late Gps gps;
  String currentDirection = "...";

  @override
  void initState() {
    super.initState();

    pos = Position(inMillis: 500);
    gps = Gps(inMillis: 500);
  }

  @override
  Widget build(BuildContext context) {
    //var distance = calculateDistance(
    //    currentLocation.latitude,
    //    currentLocation.longitude,
    //    rememberdLocation.latitude,
    //    rememberdLocation.longitude);

    const space = 20.0;

    const tableBorder = TableBorder(
        horizontalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid),
        verticalInside:
            BorderSide(width: 2, color: Background, style: BorderStyle.solid));

    gps.getRaw().listen((element) {
      setStateIfMounted(() {
        currentLocation = LatLng(element.latitude, element.longitude);
      });
    });

    pos.getCurrentDirection().forEach((element) {
      setStateIfMounted(() {
        currentDirection = getCurrentDirection(element);
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text("Geolocator"),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GridView.count(crossAxisCount: 1, children: [
              FlutterMap(
                options: MapOptions(
                    center: currentLocation,
                    zoom: 15.0,
                    screenSize: const Size(10.0, 10.0)),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return const Text("© OpenStreetMap contributors");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: currentLocation,
                        builder: (ctx) => Container(
                            key: const Key('blue'),
                            child: const Icon(Icons.my_location,
                                color: PrimaryColor, size: 40.0)),
                      ),
                      /*Marker(
                        width: 80.0,
                        height: 80.0,
                        point: rememberdLocation,
                        builder: (ctx) => const Icon(Icons.location_on,
                            color: PrimaryColor, size: 40.0),
                      ),*/
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: space),
                  Table(
                    border: tableBorder,
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Standortdienst',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                                child: Padding(
                              padding: tablePadding,
                              child: const Text(
                                'AKTIVIERT',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: PrimaryColor),
                              ),
                            ))
                          ]),
                      TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Standort',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: tablePadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lat: ' +
                                          currentLocation.latitude.toString(),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Lng: ' +
                                          currentLocation.longitude.toString(),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                      TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Ausrichtung',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: tablePadding,
                                child: Text(currentDirection),
                              ),
                            )
                          ]),
                      /*TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Letzter Standort',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: tablePadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Lat: ' + rememberdLocation.latitude.toString()),
                                    Text('Lng: ' + rememberdLocation.longitude.toString())
                                  ],
                                ),
                              ),
                            )
                          ]),*/
                      /*TableRow(
                          decoration: const BoxDecoration(color: AccentWhite),
                          children: [
                            TableCell(
                              child: Padding(
                                  padding: tablePadding,
                                  child: const Text('Entfernung',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                            TableCell(
                              child: Padding(
                                  padding: tablePadding,
                                  child: Text(distance.toString() + ' km'),
                                  ),
                            )
                          ]),*/
                    ],
                  ),
                  /* const SizedBox(height: space),
                  Table(border: tableBorder, children: [
                    TableRow(
                        //decoration: BoxDecoration(color: AccentWhite),
                        children: [
                          TableCell(
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Einheiten',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            child: Padding(padding: tablePadding),
                          )
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(color: AccentWhite),
                        children: [
                          TableCell(
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Entfernung',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            child: Padding(
                              padding: tablePadding,
                              child: const Text('Kilometer'),
                            ),
                          )
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(color: AccentWhite),
                        children: [
                          TableCell(
                            child: Padding(
                                padding: tablePadding,
                                child: const Text('Temperatur',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          TableCell(
                            child: Padding(
                              padding: tablePadding,
                              child: const Text('Grad Celsius'),
                            ),
                          )
                        ]),
                  ])*/
                ]),
              )
            ])));
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

String getCurrentDirection(Direction direction) {
  if (direction == Direction.north) {
    return "Norden";
  }
  if (direction == Direction.east) {
    return "Osten";
  }
  if (direction == Direction.south) {
    return "Süden";
  }
  if (direction == Direction.west) {
    return "Westen";
  }

  return "Undefined";
}
