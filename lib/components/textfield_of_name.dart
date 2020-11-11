import 'package:buka_buku/constant.dart';
import 'package:flutter/material.dart';

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;
  static String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 3.0,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (newValue){
          userName = newValue;
        },
        maxLines: 1,
        maxLength: 10,
        style: kInputNameText,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.3),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.3),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Nama Anda",
          hintStyle: kNameText,
        ),
      ),
    );
  }
}