import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';

class Helpers {

  static Widget createInputBox(String title) {
    return Column(
      children: [
        TextField(
            textAlign: TextAlign.center,
            cursorColor: Colors.green,
            cursorWidth: 1.0,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: TextStyle(
                color: Constants.textBlack,
                fontWeight: FontWeight.w300
              ),
            )),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 0,
                )),
            Expanded(
                flex: 11,
                child: Divider(
                  thickness: 1.0,
                  color: Colors.black,
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 0,
                ))
          ],
        )
      ],
    );
  }


  static Widget createClickText(String text, double size, Color color, MainAxisAlignment alignment){
    return Row(
      mainAxisAlignment: alignment,
      children: [
        GestureDetector(
          onTap: () {

          },
          child: Material(
            color: Colors.transparent,
            child: Text(
              text,
              style: TextStyle(
                fontSize: size,
                color: color,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(Icons.arrow_forward_ios,
            color: color,
          size: 15,),
        )
      ],
    );
  }


  static Widget createInputBox2(String hint, TextInputType keyboardType ) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Constants.backgroundWhite,
        hintText: hint,
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey
        )
      ),
    );
  }
}