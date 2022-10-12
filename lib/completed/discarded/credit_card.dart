import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import '../meta/helpers.dart';

class Creditcard extends StatefulWidget {
  const Creditcard({Key? key}) : super(key: key);

  @override
  State<Creditcard> createState() => _CreditcardState();
}

class _CreditcardState extends State<Creditcard> {

  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;
  Color backgroundWhite = Constants.backgroundWhite;
  Color textWhite = Constants.textWhite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          '/Information',
                          arguments: "nothing");
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),

            Align(alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30),
                  child: Text('Betalingsoplysninger',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,

                  ),),
                )),

            Container(
              color: primaryGreen,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Material(
                            color: Colors.transparent,
                            child: FittedBox(
                              child: Icon(Icons.credit_card)
                            ),
                          ),
                        ),
                      ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Material(
                              color: Colors.transparent,
                              child: FittedBox(
                                  child: Icon(Icons.credit_card)
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Material(
                              color: Colors.transparent,
                              child: FittedBox(
                                  child: Icon(Icons.credit_card)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter()
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Constants.backgroundWhite,
                          hintText: 'Card Number',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),

                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardMonthInputFormatter()
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Constants.backgroundWhite,
                                  hintText: 'MM/YY',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Constants.backgroundWhite,
                                  hintText: 'CCV',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;if (newValue.selection.baseOffset == 0) {
      return newValue;
    }var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;if (newValue.selection.baseOffset == 0) {
      return newValue;
    }var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}


