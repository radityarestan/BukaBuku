import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.height,
    this.onTap,
  }) : super(key: key);

  final double height;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0, 0),
          ),
        ], color: Colors.white),
        width: double.infinity,
        height: height * 0.09,
        child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: height * 0.07,
              height: height * 0.07,
              child: Image.asset('images/Logo Datar.png'),
            ),
          ),
        ),
      ),
    );
  }
}