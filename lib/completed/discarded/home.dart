/*
import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/models/lesson/booking_list.dart';

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
              padding: const EdgeInsets.only(
                  top: 20, left: 20.0, right: 20.0, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: createClickText('Køreplan', 25, textBlack)),
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
                  if (BookingList.bookingList.isEmpty)
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Text(
                        'Du har ingen lektioner booket.',
                        style: TextStyle(
                            color: textBlack,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1),
                      ),
                    ),
                  if (BookingList.bookingList.length > 0)
                    Expanded(
                      child: ListView.builder(
                        itemCount: BookingList.bookingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '${BookingList.bookingList[index].lesson?.name}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: textBlack),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Book næste lektion',
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
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

  Widget createBookingList() {
    return Container();
  }
}

 */
