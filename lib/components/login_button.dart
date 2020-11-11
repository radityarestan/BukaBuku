import 'package:buka_buku/constant.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onPressed;
  LoginButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      height: width * 0.15,
      decoration: BoxDecoration(
        color: Color(0xFF2EE2A1),
        borderRadius:
            BorderRadius.circular(width * 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 3.0,
            offset: Offset(2, 4),
          ),
        ]
      ),
      child: Material(
        borderRadius:
            BorderRadius.circular(width * 0.3),
        color: Color(0xFF2EE2A1),
        child: InkWell(
          borderRadius:
              BorderRadius.circular(width * 0.3),
          splashColor: Color(0xFF94E4B7),
          onTap: onPressed,
          child: Center(
            child: Text(
              "Login",
              style: kLoginText,
            ),
          ),
        ),
      ),
    );
  }
}
