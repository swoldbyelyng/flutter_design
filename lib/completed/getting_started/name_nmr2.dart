import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import 'package:flutter/services.dart';


class NameNumber2 extends StatefulWidget {

  const NameNumber2({Key? key}) : super(key: key);

  @override
  State<NameNumber2> createState() => _NameNumber2State();
}

class _NameNumber2State extends State<NameNumber2> {
  var dropdownvalue = '+45';
  var items = ['+45', '+40', '+21', '+52', '+68'];

  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;
  Color textBlack = Constants.textBlack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.backgroundWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 35.0, left: 20.0, right: 20.0, bottom: 70.0),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.question_mark))),
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/', arguments: "nothing");
                            },
                            child: const Icon(Icons.close))))
              ],
            ),
          ),
          Material(
            color: Constants.backgroundWhite,
            child: const Text(
              'What is your first-name?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Material(
            color: Constants.backgroundWhite,
            child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textGreen
                ),
                cursorColor: primaryGreen,
                cursorWidth: 1.0,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'name',
                  hintStyle: TextStyle(color: Colors.grey),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: Row(
              children: const [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 0,
                    )),
                Expanded(
                    flex: 13,
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black,
                    )),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 0,
                    ))
              ],
            ),
          ),
          Material(
            color: Constants.backgroundWhite,
            child: const Text(
              'What is your mobile phone number?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Material(
                      color: Constants.backgroundWhite,
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  )),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Material(
                      color: Constants.backgroundWhite,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                            PhoneNumberInputFormatter()
                          ],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: textGreen
                          ),
                          cursorColor: primaryGreen,
                          cursorWidth: 1.0,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'number',
                            hintStyle: TextStyle(color: Colors.grey),
                          )),
                    ),
                  )),
              const Expanded(flex: 2, child: SizedBox())
            ],
          ),
          Row(
            children: const [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                  flex: 4,
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  )),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 8,
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  )),
              Expanded(flex: 2, child: SizedBox()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
            child: Material(
              color: Constants.backgroundWhite,
                child: Text.rich(
              TextSpan(
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                  children: [
                    const TextSpan(
                        text: 'By continuing, you are accepting JustDrive\'s '),
                    TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                            color: primaryGreen,
                            decoration: TextDecoration.underline)),
                  ]),
              textAlign: TextAlign.center,
            )),
          ),
          const Expanded(child: SizedBox()),
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
        ],
      ),
    );
  }
}


class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;if (newValue.selection.baseOffset == 0) {
      return newValue;
    }var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}