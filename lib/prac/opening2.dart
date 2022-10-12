import 'package:flutter/material.dart';

class Opening2 extends StatefulWidget {
  const Opening2({Key? key}) : super(key: key);

  @override
  State<Opening2> createState() => _Opening2State();
}

class _Opening2State extends State<Opening2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_test.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
