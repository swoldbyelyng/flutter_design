import 'package:flutter_design/models/booking/availability.dart';
import 'theory_location.dart';

import 'day.dart';

class DayList {
  static final dayList = [
    Day(DateTime(2022, 9, 10), TheoryLocation.location1, [
      Availability(DateTime(2022, 9, 10, 8), Duration(hours: 1, minutes: 30),
          TheoryLocation.location1),
    ]),

    Day(DateTime(2022, 9, 10), TheoryLocation.location2, [
      Availability(DateTime(2022, 9, 10, 12), Duration(hours: 1, minutes: 30),
          TheoryLocation.location2),
      Availability(DateTime(2022, 9, 10, 18), Duration(hours: 1, minutes: 30),
          TheoryLocation.location2),
    ]),

    Day(DateTime(2022, 9, 12), TheoryLocation.location3, [
      Availability(DateTime(2022, 9, 12, 7), Duration(hours: 1, minutes: 30),
          TheoryLocation.location2),
      Availability(DateTime(2022, 9, 12, 12), Duration(hours: 1, minutes: 30),
          TheoryLocation.location2),
      Availability(DateTime(2022, 9, 12, 19), Duration(hours: 1, minutes: 30),
          TheoryLocation.location2),
    ]),

    Day(DateTime(2022, 9, 12), TheoryLocation.location3, [
      Availability(DateTime(2022, 9, 12, 6), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3),
      Availability(DateTime(2022, 9, 12, 12), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3),
      Availability(DateTime(2022, 9, 12, 16), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3),
    ]),

    Day(DateTime(2022, 9, 13), TheoryLocation.location3, [
      Availability(DateTime(2022, 9, 13, 12), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3),
      Availability(DateTime(2022, 9, 13, 14), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3),
    ]),
    Day(DateTime(2022, 9, 15), TheoryLocation.location3, [
      Availability(DateTime(2022, 9, 15, 17), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3)
    ]),
    Day(DateTime(2022, 9, 16), TheoryLocation.location3, [
      Availability(DateTime(2022, 9, 16, 17), Duration(hours: 1, minutes: 30),
          TheoryLocation.location3)
    ]),
    Day(DateTime(2022, 9, 17), TheoryLocation.location4, [
      Availability(DateTime(2022, 9, 17, 17), Duration(hours: 1, minutes: 30),
          TheoryLocation.location4)
    ]),
    Day(DateTime(2022, 9, 18), TheoryLocation.location4, [
      Availability(DateTime(2022, 9, 18, 17), Duration(hours: 1, minutes: 30),
          TheoryLocation.location4)
    ]),
    Day(DateTime(2022, 9, 19), TheoryLocation.location4, [
      Availability(DateTime(2022, 9, 19, 10), Duration(hours: 1, minutes: 30),
          TheoryLocation.location4)
    ]),
  ];
}
