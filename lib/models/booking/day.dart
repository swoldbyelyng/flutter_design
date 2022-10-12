import 'availability.dart';
import 'package:intl/intl.dart';
import 'theory_location.dart';

class Day {
  DateTime date;
  TheoryLocation theoryLocation;
  List<Availability> availabilityList;

  Day(this.date, this.theoryLocation, this.availabilityList);

  DateTime getStartTime() {
    DateTime startTime = DateTime(2200);
    if(availabilityList.isNotEmpty){
      startTime = availabilityList.first.startTime;
    }
    return startTime;
  }

  DateTime getEndTime(){
    DateTime endTime = DateTime(2005);
    if(availabilityList.isNotEmpty){
      endTime = availabilityList.last.startTime.add(availabilityList.last.duration);
    }
    return endTime;
  }
}
