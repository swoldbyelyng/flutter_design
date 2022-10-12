import 'package:flutter/material.dart';
import 'package:flutter_design/home/home2.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter_design/home/lesson_plan.dart';
import 'package:flutter_design/home/lesson_plan2.dart';
import 'package:flutter_design/home/theory.dart';
import 'package:flutter_design/home/account.dart';
import 'package:flutter_design/make_booking/google_map_test.dart';



class PrimaryFrame extends StatefulWidget {
  const PrimaryFrame({Key? key}) : super(key: key);

  @override
  State<PrimaryFrame> createState() => _PrimaryFrameState();
}

class _PrimaryFrameState extends State<PrimaryFrame> {

  Color figmaGreen = Constants.figmaGreen;
  Color buttonGreen = Constants.buttonGreen;

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LicenseeHome()
    ,
    LessonPlan()
    ,
    GoogleMapTest()
    ,
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'lesson-plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'theory',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'user'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: buttonGreen,
        onTap: _onItemTapped,
      ),
    );



  }
}
