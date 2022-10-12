import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/make_booking/location_map.dart';
import 'package:flutter_design/models/booking/day_list.dart';
import 'package:flutter_design/models/booking/theory_location.dart';
import 'package:flutter_design/models/booking/day.dart';
import 'package:flutter_design/models/booking/availability.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_design/models/booking/availability.dart';
import 'package:flutter_design/completed/arguments/availabilities_args.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';
import 'package:flutter_design/models/lesson/theory_booking.dart';
import 'package:flutter_design/completed/arguments/confirmation_args.dart';

const textGreen = Constants.textGreen;
const primaryGreen = Constants.primaryGreen;
const backgroundWhite = Constants.backgroundWhite;
const textWhite = Constants.textWhite;
final textBlack = Constants.textBlack;
final primaryBlack = Constants.primaryBlack;
final figmaGreen = Constants.figmaGreen;
final backgroundGrey = Constants.backgroundGrey;

class BookingAvailabilities extends StatefulWidget {

  final AvailabilitiesArguments arguments;

  const BookingAvailabilities({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  State<BookingAvailabilities> createState() => _BookingAvailabilitiesState();
}

class _BookingAvailabilitiesState extends State<BookingAvailabilities> {

  final List<Availability> _availabilityList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: LocationMap(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              DateFormat('E, d MMMM').format(widget.arguments.date),
              style: const TextStyle(
                  fontSize: 23, fontWeight: FontWeight.w300, letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
            child: Text(
              '${LessonList.lessonMap[widget.arguments.lesson]!.subName} - ${widget.arguments.radius} km',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: 1),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: calcListLength(),
              itemBuilder: (context, index) {
                return createAvailabilityItem(_availabilityList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget createAvailabilityItem(Availability availability) {
    String address = availability.location.address;
    String startTime = DateFormat('Hm').format(availability.startTime);
    String endTime = DateFormat('Hm')
        .format(availability.startTime.add(availability.duration));
    String timeSlot = '$startTime - $endTime';

    return GestureDetector(
    // pass a confirmation arg here.
      onTap: () {
        TheoryBooking theoryBooking = TheoryBooking(widget.arguments.lesson, availability.startTime, availability.duration, availability.location);
        ConfirmationArgs confirmationArgs = ConfirmationArgs(theoryBooking);
        Navigator.of(context)
            .pushNamed('/ConfirmBooking', arguments: confirmationArgs);
      },
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'images/map/green_marker.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address,
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 1,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        timeSlot,
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
              color: primaryBlack,
            ),
          )
        ],
      ),
    );
  }

  int calcListLength() {
    DateTime chosenDate = widget.arguments.date;
    int value = 0;
    for (int i = 0; i < DayList.dayList.length; i++) {
      if (DayList.dayList[i].date == chosenDate) {
        if (DayList.dayList[i].theoryLocation.distance <= widget.arguments.radius) {
          for (int ii = 0;
              ii < DayList.dayList[i].availabilityList.length;
              ii++) {
            value++;
            _availabilityList.add(DayList.dayList[i].availabilityList[ii]);
          }
        }
      } else if (DayList.dayList[i].date.compareTo(chosenDate) > 0) {
        break;
      }
    }
    _availabilityList.sort((a, b){
      return a.startTime.compareTo(b.startTime);
    });
    return value;
  }
}
