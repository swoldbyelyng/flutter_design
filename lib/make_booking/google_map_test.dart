import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapTest extends StatefulWidget {
  const GoogleMapTest({Key? key}) : super(key: key);

  @override
  State<GoogleMapTest> createState() => _GoogleMapTestState();
}

class _GoogleMapTestState extends State<GoogleMapTest> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(55.67, 12.57);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
