import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image : DecorationImage(
          image: ExactAssetImage('images/background_test.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}