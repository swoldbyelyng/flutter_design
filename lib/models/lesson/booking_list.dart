import 'theory_booking.dart';
import 'lesson_list.dart';
import 'package:flutter_design/models/booking/theory_location.dart';

class BookingList {
  static List<TheoryBooking> bookingList = [];
  static List<TheoryBooking> completionList = [];

  //adds bookings, earliest booking first.
  static void addBooking(TheoryBooking newBooking) {
    bookingList.add(newBooking);
  }

  static void completeBooking(int lessonNumber) {
    TheoryBooking transfer = TheoryBooking(
        1, DateTime(2022), Duration.zero, TheoryLocation.location1);
    bool bookingExists = false;
    for (int i = 0; i < bookingList.length; i++) {
      if (bookingList[i].lesson == lessonNumber) {
        transfer = bookingList[i];
        bookingExists = true;
        bookingList.removeAt(i);
      }

      if (bookingExists) {
        completionList.add(transfer);
      }
    }
  }
}
