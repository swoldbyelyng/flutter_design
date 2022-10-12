import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/map_marker.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiZGllZ292ZWxvcGVyIiwiYSI6ImNrdGppMnh0bjFjZ3MzMm5sejRtcTlwbTQifQ.lwdbukS6p7bBWBuk2URBKg';
const MAPBOX_STYLE = 'mapbox/light-v10';
const MARKER_COLOR = Color(0xFF3DC5A7);
Color figmaGreen = Constants.figmaGreen;
Color buttonGreen = Constants.buttonGreen;
final _myLocation = LatLng(-12.0362176, -77.0296812);
const MARKER_SIZE_EXPANDED = 55.0;
const MARKER_SIZE_SHRINK = 38.0;

class _LocationMapState extends State<LocationMap> with SingleTickerProviderStateMixin{
  final _pageController = PageController();
  late final AnimationController _animationController;
  int _selectedIndex = 0;


  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(Marker(
          height: MARKER_SIZE_EXPANDED,
          width: MARKER_SIZE_EXPANDED,
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                setState(() {
                  _pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.elasticOut);
                  print('Selected: ${mapItem.title}');
                });
              },
              child: _LocationMarker(
                selected: _selectedIndex == i ,
              ),
            );
          }));
    }
    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                minZoom: 5, maxZoom: 18, zoom: 13, center: _myLocation),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': MAPBOX_STYLE,
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(markers: [
                Marker(
                    height: 60,
                    width: 60,
                    point: _myLocation,
                    builder: (_) {
                      return _MyLocationMarker(_animationController);
                    })
              ]),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat();
    super.initState();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class _LocationMarker extends StatelessWidget {
  const _LocationMarker({Key? key, this.selected = false}) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINK;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset('images/map/green_marker.png'),
      ),
    );
  }
}


class _MyLocationMarker extends AnimatedWidget {
  const _MyLocationMarker( Animation<double> animation, {Key? key}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(1, 0, value)!;
    final size = 50.0;
    return Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: size * value,
                width: size * value,
                decoration: BoxDecoration(
                    color: MARKER_COLOR.withOpacity(0.5 * newValue),
                    shape: BoxShape.circle
                ),
              ),
            ),
            Center(
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(color: buttonGreen, shape: BoxShape.circle),
              ),
            ),
          ],
        )

    );
  }
}


