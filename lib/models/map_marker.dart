import 'package:latlong2/latlong.dart';

class MapMarker {
  final String image;
  final String title;
  final String address;
  final LatLng location;

  MapMarker(
      {required this.image,
      required this.title,
      required this.address,
      required this.location});
}

final _locations = [
  LatLng(-12.0080041, -77.0778237),
  LatLng(-12.0430962, -77.0208307),
  LatLng(-12.0480045, -77.0205112),
];


const _path = 'images/map/';

final mapMarkers = [
  MapMarker(
    image: '${_path}someLogo.png',
    title: 'Title 1',
    address: 'Address 1',
    location: _locations[0],
  ),

  MapMarker(
    image: '${_path}someLogo.png',
    title: 'Title 2',
    address: 'Address 2',
    location: _locations[1],
  ),

  MapMarker(
    image: '${_path}someLogo.png',
    title: 'Title 3',
    address: 'Address 3',
    location: _locations[2],
  )
];

