import 'package:flutter_design/models/booking/availability.dart';
import 'package:latlong2/latlong.dart';

class TheoryLocation {
  final String image;
  final String title;
  final String address;
  final LatLng location;
  final double distance;

  static final Map<int, TheoryLocation> locationMap = {
    1 : locations[0],
    2 : locations[1],
    3 : locations[2]
  };

  TheoryLocation(this.image, this.title, this.address, this.location,
      this.distance);

  static final location1 = TheoryLocation(
    '${_path}someLogo.png',
    'Østerbrogade Theory',
    'Østerbrogade 18.',
    _locations[0],
    8.0,
  );
  static final location2 = TheoryLocation(
    '${_path}someLogo.png',
    'Nordre Frihavnsgade Theory',
    'Nordre Frihavnsgade 3.',
    _locations[1],
    4.5,
  );
  static final location3 =   TheoryLocation(
    '${_path}someLogo.png',
    'H. C. Andersens Theory',
    'H. C. Andersens Boul. 25.',
    _locations[2],
    2.0,
  );
  static final location4 =   TheoryLocation(
    '${_path}someLogo.png',
    'Strand Boul. Theory',
    'Strand Boul. 50.',
    _locations[2],
    18.0,
  );
}

final _locations = [
  LatLng(-12.0080041, -77.0778237),
  LatLng(-12.0430962, -77.0208307),
  LatLng(-12.0480045, -77.0205112),
];

const _path = 'images/map/';

final locations = [
  TheoryLocation(
    '${_path}someLogo.png',
    'Østerbrogade Theory',
    'Østerbrogade 3.',
    _locations[0],
    8.0,
  ),
  TheoryLocation(
    '${_path}someLogo.png',
    'Nordre Frihavnsgade Theory',
    'Nordre Frihavnsgade 3.',
    _locations[1],
    4.5,
  ),
  TheoryLocation(
    '${_path}someLogo.png',
    'H. C. Andersens Theory',
    'H. C. Andersens Boul. 3.',
    _locations[2],
    2.0,
  ),
];




