import 'package:flutter/material.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';
import 'package:flutter_design/models/lesson/booking_list.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/lesson/lesson.dart';
import 'package:flutter_design/models/lesson/theory_booking.dart';

class LessonPlan2 extends StatefulWidget {
  const LessonPlan2({Key? key}) : super(key: key);

  @override
  State<LessonPlan2> createState() => _LessonPlan2State();
}

Color textGreen = Constants.textGreen;
Color primaryGreen = Constants.primaryGreen;
Color backgroundWhite = Constants.backgroundWhite;
Color textWhite = Constants.textWhite;
Color textBlack = Constants.textBlack;
Color primaryBlack = Constants.primaryBlack;
Color figmaGreen = Constants.figmaGreen;

class _LessonPlan2State extends State<LessonPlan2> {
  @override
  Widget build(BuildContext context) {
    List<TheoryBooking> compAndBook =
        BookingList.completionList + BookingList.bookingList;
    List<Lesson> remaining = [];
    for (int i = compAndBook.length; i < LessonList.lessonList.length; i++) {
      remaining.add(LessonList.lessonList[i]);
    }
    List<dynamic> fullList = [];

    for (int i = 0; i < compAndBook.length; i++) {
      fullList.add(compAndBook[i]);
    }
    for (int i = 0; i < remaining.length; i++) {
      fullList.add(remaining[i]);
    }

    return Scaffold(
      backgroundColor: figmaGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: fullList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (fullList[index] is TheoryBooking) {
                        return completedLesson(fullList[index]);
                      } else if (fullList[index] is Lesson) {
                        return incompleteLesson(fullList[index]);
                      }
                      return const SizedBox.shrink();
                    })),
            nextLessonButton(),
          ],
        ),
      ),
    );
  }

  Widget completedLesson(TheoryBooking tBooking) {
    return Text(
      LessonList.lessonMap[tBooking.lesson]!.name,
    );
  }

  Widget bookedLesson() {
    return Text('Booked');
  }

  Widget incompleteLesson(Lesson lesson){
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 3),
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text(lesson.name,
                    style: TextStyle(
                        color: textBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),),
                ),
                Text(lesson.subName,
                  style: TextStyle(
                      color: textBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                  ),)
              ],
            ),
          )
      ),
    );
  }

  Widget nextLessonButton() {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/', arguments: "nothing");
      },
      child: Card(
        color: figmaGreen,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Book next lesson',
                style: TextStyle(
                    fontSize: 17,
                    color: textWhite,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
