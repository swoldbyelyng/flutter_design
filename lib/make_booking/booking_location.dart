import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/completed/meta/helpers.dart';
import 'package:flutter_design/make_booking/location_map.dart';
import 'package:flutter_design/completed/arguments/booking_args.dart';


const textGreen = Constants.textGreen;
const primaryGreen = Constants.primaryGreen;
const backgroundWhite = Constants.backgroundWhite;
const textWhite = Constants.textWhite;
final textBlack = Constants.textBlack;
final primaryBlack = Constants.primaryBlack;
final figmaGreen = Constants.figmaGreen;
final backgroundGrey = Constants.backgroundGrey;

class BookingLocation extends StatelessWidget {

  final BookingArgs args;

  const BookingLocation(
      this.args,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundGrey,

      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          '/PrimaryFrame',
                          arguments: "nothing");
                    },
                    child: Icon(Icons.arrow_back_ios,
                    color: primaryBlack,)),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('First, tell us your location.',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: textBlack
                ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Helpers.createInputBox('location'),
            ),

            Expanded(child: LocationMap()),
            SizedBox(height: 20),

            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: Material(
                    color: backgroundGrey,
                  )),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {

                        BookingArgs bookingArgs = args;

                        Navigator.of(context)
                            .pushNamed('/AvailableLocations', arguments: bookingArgs);
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
              ),
            ),

          ],
        ),
      ),

    );
  }
}
