import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/make_booking/location_map.dart';
import 'package:flutter_design/models/booking/day_list.dart';
import 'package:flutter_design/models/booking/theory_location.dart';
import 'package:flutter_design/models/booking/day.dart';
import 'package:flutter_design/models/booking/availability.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_design/completed/arguments/availabilities_args.dart';
import 'package:flutter_design/completed/arguments/booking_args.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';

const textGreen = Constants.textGreen;
const primaryGreen = Constants.primaryGreen;
const backgroundWhite = Constants.backgroundWhite;
const textWhite = Constants.textWhite;
final textBlack = Constants.textBlack;
final primaryBlack = Constants.primaryBlack;
final figmaGreen = Constants.figmaGreen;
final backgroundGrey = Constants.backgroundGrey;

class AvailableLocations extends StatefulWidget {
  final BookingArgs args;

  const AvailableLocations({required this.args, Key? key}) : super(key: key);

  @override
  State<AvailableLocations> createState() => _AvailableLocationsState();
}

class _AvailableLocationsState extends State<AvailableLocations> {
  var dropdownvalue = '5 km';
  var items = ['5 km', '10 km', '20 km'];
  DateTime currDay = DateTime(2023);
  DateTime startTime = DateTime(2100);
  DateTime endTime = DateTime(2010);
  bool inRadius = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //Text(LessonList.lessonMap[widget.args.lesson]!.name),
          Expanded(
            child: Stack(
              children: [
                const LocationMap(),

                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LessonList.lessonMap[widget.args.lesson]!.name,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: textBlack),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        LessonList.lessonMap[widget.args.lesson]!.subName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: textBlack),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              color: backgroundGrey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'radius',
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w300,
                            color: textBlack,
                          ),
                        ),
                      ),
                      DropdownButton(
                        style: TextStyle(
                            color: textBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.5),
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: DayList.dayList.length + 1,
            itemBuilder: (context, index) {
              if (DayList.dayList.isNotEmpty) {
                if (index == 0) {
                  currDay = DayList.dayList.first.date;
                }

                if (index == DayList.dayList.length) {
                  if (inRadius == true) {
                    inRadius = false;
                    DateTime outDay = currDay;
                    DateTime outStart = startTime;
                    DateTime outEnd = endTime;
                    currDay = DateTime(2023);
                    startTime = DateTime(2100);
                    endTime = DateTime(2010);
                    return createAvailabilityListItem(outStart, outEnd, outDay);
                  } else {
                    currDay = DateTime(2023);
                    startTime = DateTime(2100);
                    endTime = DateTime(2010);
                    return const SizedBox.shrink();
                  }
                }

                if (DayList.dayList[index].date == currDay) {
                  if (DayList.dayList[index].theoryLocation.distance <=
                      radiusMap[dropdownvalue]!) {
                    inRadius = true;
                    Day day = DayList.dayList[index];
                    if (day.availabilityList.isNotEmpty) {
                      if (day.getStartTime().compareTo(startTime) < 0) {
                        startTime = day.getStartTime();
                      }
                      if (day.getEndTime().compareTo(endTime) > 0) {
                        endTime = day.getEndTime();
                      }
                    }
                  }
                  return const SizedBox.shrink();
                } else {
                  if (inRadius == true) {
                    DateTime outDay = currDay;
                    DateTime outStart = startTime;
                    DateTime outEnd = endTime;
                    if (DayList.dayList[index].theoryLocation.distance >
                        radiusMap[dropdownvalue]!) {
                      inRadius = false;
                    }
                    currDay = DayList.dayList[index].date;
                    startTime = DayList.dayList[index].getStartTime();
                    endTime = DayList.dayList[index].getEndTime();
                    return createAvailabilityListItem(outStart, outEnd, outDay);
                  } else {
                    if (DayList.dayList[index].theoryLocation.distance <=
                        radiusMap[dropdownvalue]!) {
                      inRadius = true;
                    }
                    currDay = DayList.dayList[index].date;
                    startTime = DayList.dayList[index].getStartTime();
                    endTime = DayList.dayList[index].getEndTime();
                    return const SizedBox.shrink();
                  }
                }
              } else {
                return const SizedBox.shrink();
              }
            },
          ))
        ],
      ),
    );
  }

  Widget createAvailabilityListItem(
      DateTime start, DateTime end, DateTime date) {
    DateTime argumentDay = DateTime(start.year, start.month, start.day);
    String dateDay = DateFormat('E').format(date);
    String dateNumber = date.day.toString();
    String startTime = DateFormat('Hm').format(start);
    String endTime = DateFormat('Hm').format(end);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/BookingAvailabilities',
            arguments: AvailabilitiesArguments(
                argumentDay, radiusMap[dropdownvalue]!, widget.args.lesson));
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
                  child: Column(
                    children: [
                      Text(
                        dateDay,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: textBlack,
                            fontSize: 14),
                      ),
                      Text(
                        dateNumber,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: textBlack),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'availabilities from',
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 0.5,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '$startTime - $endTime',
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

  int calcListLength(List<Day> dayList) {
    int value = 0;
    DateTime currDate = DateTime(2022);

    for (int i = 0; i < dayList.length; i++) {
      if (dayList[i].date != currDate) {
        if (dayList[i].theoryLocation.distance <= radiusMap[dropdownvalue]!) {
          value++;
          currDate = dayList[i].date;
        }
      }
    }
    return value;
  }

  final Map<String, double> radiusMap = {
    '5 km': 5.0,
    '10 km': 10.0,
    '20 km': 20.0,
  };
}
