import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/lesson/lesson_list.dart';
import 'package:flutter_design/models/lesson/lesson.dart';

class LessonPlan extends StatefulWidget {
  const LessonPlan({Key? key}) : super(key: key);

  @override
  State<LessonPlan> createState() => _LessonPlanState();
}

class _LessonPlanState extends State<LessonPlan> {
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
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/', arguments: "nothing");
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: primaryBlack,
                          ))),
                  Spacer(),

                  Text(
                    'Lesson-plan',
                    style: TextStyle(
                      color: textBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 25
                    ),
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
              child: ListView.builder(
                shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: LessonList.lessonList.length,
                  itemBuilder: (BuildContext context, int index){
                    return createLessonCard(LessonList.lessonList[index]);
                  }
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget createLessonCard(Lesson lesson){
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Card(
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(lesson.name,
                style: TextStyle(
                  color: textBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w400
                ),),
              ),
              Text(lesson.subName,
              style: TextStyle(
                color: textBlack,
                fontSize: 13,
                fontWeight: FontWeight.w300
              ),)
            ],
          ),
        )
      ),
    );
  }

}
