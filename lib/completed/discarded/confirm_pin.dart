import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_design/completed/meta/constants.dart';

class ConfirmPin extends StatefulWidget {
  const ConfirmPin({Key? key}) : super(key: key);

  @override
  State<ConfirmPin> createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<ConfirmPin> {
  String currentText = "";

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundWhite,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 70.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        '/NameAndNumber',
                                        arguments: "nothing");
                                  },
                                  child: Icon(Icons.arrow_back_ios)))),
                      const Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.question_mark)))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: "+45 50 34 28 94",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15)),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: MediaQuery.of(context).size.width / 4),
                  child: Material(
                    color: Constants.backgroundWhite,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      useHapticFeedback: true,
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          activeColor: Colors.black,
                          selectedColor: Colors.green,
                          inactiveColor: Colors.black,
                          activeFillColor: Colors.black,
                          fieldWidth: 30,
                          borderWidth: 1.1),
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => snackBar("Code Resent."),
                      child: Text(
                        "resend code",
                        style: TextStyle(
                            color: textGreen,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/ConfirmPin', arguments: "nothing");
                  },
                  child: const Material(
                    color: Colors.green,
                    child: Padding(
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
        ],
      ),
    );
  }
}
