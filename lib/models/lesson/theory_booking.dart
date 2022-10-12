import 'package:flutter_design/models/booking/theory_location.dart';

import 'lesson.dart';

class TheoryBooking{

  int lesson;
  DateTime date;
  Duration duration;
  TheoryLocation location;

  TheoryBooking(this.lesson, this.date, this.duration, this.location);
}