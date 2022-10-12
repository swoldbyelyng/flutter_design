import 'package:flutter/material.dart';
import 'package:flutter_design/completed/arguments/booking_args.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/lesson/booking_list.dart';
import 'package:flutter_design/models/lesson/theory_booking.dart';
import 'package:intl/intl.dart';
import 'package:flutter_design/models/lesson/license_progress.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';

class LicenseeHome extends StatefulWidget {
  const LicenseeHome({Key? key}) : super(key: key);

  @override
  State<LicenseeHome> createState() => _LicenseeHomeState();
}

class _LicenseeHomeState extends State<LicenseeHome> {
  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;
  Color backgroundWhite = Constants.backgroundWhite;
  Color textWhite = Constants.textWhite;
  Color textBlack = Constants.textBlack;
  Color primaryBlack = Constants.primaryBlack;
  Color figmaGreen = Constants.figmaGreen;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: figmaGreen,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: createClickText('Bookings', 25, textBlack)),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/', arguments: "nothing");
                          },
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: primaryBlack,
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: primaryBlack,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: BookingList.bookingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return createBookingCard(
                            BookingList.bookingList[index]);
                      },
                    ),
                  ),

                  if(BookingList.bookingList.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('You have no lessons booked.',
                          style: TextStyle(
                              color: textBlack,
                              letterSpacing: 1,
                              fontSize: 28,
                              fontWeight: FontWeight.w300
                          ),),
                      ),
                    ),



                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Check lesson type, and navigate accordingly.
                          //For now just use lesson 1.
                          int nextLesson = -1;



                          if(BookingList.bookingList.isNotEmpty) {
                            nextLesson = BookingList.bookingList.last.lesson;
                            nextLesson++;
                          }else{
                            nextLesson = LicenseProgress.getNextIncomplete();
                          }

                          BookingArgs bookingArgs = BookingArgs(nextLesson);

                          Navigator.of(context)
                              .pushNamed('/Booking', arguments: bookingArgs);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: textBlack),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Book next lesson',
                                style: TextStyle(
                                    color: textBlack,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Quick Choices',
                  style: TextStyle(
                    fontSize: 25,
                    color: textBlack,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: primaryBlack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: textBlack,
                                ),
                              ),
                              Text(
                                'Calendar',
                                style:
                                TextStyle(color: textBlack, letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(),
                  ),
                  Expanded(
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Icon(
                                  Icons.thumb_up_outlined,
                                  color: textBlack,
                                ),
                              ),
                              Text(
                                'Invite friends',
                                style:
                                TextStyle(color: textBlack, letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createClickText(String text, double size, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Material(
            color: Colors.transparent,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: size,
                  color: color,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(
            Icons.arrow_forward_ios,
            color: color,
            size: size - 7,
          ),
        )
      ],
    );
  }

  Widget createBookingCard(TheoryBooking booking) {
    String day = DateFormat('E').format(booking.date);
    String date = booking.date.day.toString();
    String? name = LessonList.lessonMap[booking.lesson]?.name;
    String? subName = LessonList.lessonMap[booking.lesson]?.subName;
    String startTime = DateFormat('Hm').format(booking.date);
    String endTime =
    DateFormat('Hm').format(booking.date.add(booking.duration));

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                //date + date
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text(
                        day,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: textBlack, fontSize: 14),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: textBlack),
                      ),
                    ],
                  ),
                ),

                //Name + subName
                Expanded(
                  flex: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 1,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        subName!,
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 1,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        booking.location.address,
                        style: TextStyle(
                            color: textBlack,
                            letterSpacing: 1,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),

                //start - end time
                Expanded(
                  flex: 8,
                  child: Text(
                    '$startTime - $endTime',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: textBlack),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
