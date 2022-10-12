import 'package:flutter/material.dart';

class Theory extends StatefulWidget {
  const Theory({Key? key}) : super(key: key);

  @override
  State<Theory> createState() => _TheoryState();
}

class _TheoryState extends State<Theory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Theory'),
      ),
    );
  }
}
