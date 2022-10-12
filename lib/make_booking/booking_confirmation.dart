import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/lesson/booking_list.dart';
import 'package:flutter_design/models/lesson/theory_booking.dart';
import 'package:flutter_design/completed/arguments/confirmation_args.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';
import 'package:intl/intl.dart';

const textGreen = Constants.textGreen;
const primaryGreen = Constants.primaryGreen;
const backgroundWhite = Constants.backgroundWhite;
const textWhite = Constants.textWhite;
final textBlack = Constants.textBlack;
final primaryBlack = Constants.primaryBlack;
final figmaGreen = Constants.figmaGreen;
final backgroundGrey = Constants.backgroundGrey;
final textGrey = Constants.textGrey;

class ConfirmBooking extends StatefulWidget {
  final ConfirmationArgs args;

  const ConfirmBooking({required this.args, Key? key}) : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  bool checkTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/PrimaryFrame', arguments: "nothing");
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: primaryBlack,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm your booking',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: textBlack),
                ),
              ),
            ),
            //Lesson
            space(20),
            standardHeadline('lesson'),
            space(5),
            standardSubtext(
                '${LessonList.lessonMap[widget.args.booking.lesson]!.name} - ${LessonList.lessonMap[widget.args.booking.lesson]!.subName}'),

            space(5),
            standardDivider(),

            //Location
            space(20),
            standardHeadline('location'),
            space(5),
            standardSubtext(widget.args.booking.location.address),
            space(5),
            standardDivider(),

            //Date and Time
            space(20),
            standardHeadline('date and time'),
            space(5),
            standardSubtext(
                DateFormat('E, d MMMM').format(widget.args.booking.date)),
            space(2),
            standardSubtext(DateFormat('Hm').format(widget.args.booking.date) +
                ' - ' +
                DateFormat('Hm').format(widget.args.booking.date
                    .add(widget.args.booking.duration))),
            space(5),
            standardDivider(),

            //CheckBox
            space(20),
            checkBox('text'),
            space(15),
            clickText('Terms and Conditions'),
            space(20),
            clickText('No-show rules'),

            //Confirm button
            const Expanded(child: SizedBox()),
            confirmButton()
          ],
        ),
      ),
    );
  }

  Widget standardHeadline(String text) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(text,
              style: TextStyle(
                  color: textGrey,
                  letterSpacing: 0.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w300)),
        ));
  }

  Widget standardSubtext(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: TextStyle(
              color: textBlack,
              letterSpacing: 0.5,
              fontSize: 18,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget standardDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        thickness: 1,
        color: primaryBlack,
      ),
    );
  }

  Widget space(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget checkBox(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Checkbox(
              value: checkTerms,
              onChanged: (newValue) {
                setState(() {
                  checkTerms = newValue!;
                });
              },
              //fillcolor
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return primaryGreen.withOpacity(.32);
                }
                return primaryGreen;
              })),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'The information I have provided is correct and I have read and accepted JustDrive\'s:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }

  Widget clickText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 48),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Material(
              color: Colors.transparent,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: textGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Icon(
              Icons.arrow_forward_ios,
              color: textGrey,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget confirmButton() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: backgroundGrey,
              height: 66,
              width: 100,
            )),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              BookingList.addBooking(widget.args.booking);
              Navigator.of(context)
                  .pushNamed('/PrimaryFrame', arguments: "nothing");
            },
            child: Material(
              color: primaryGreen,
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: Center(
                    child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
