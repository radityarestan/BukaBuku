import 'dart:ui';

import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String imageSource;
  final String title;
  final String writer;
  final double rating;
  final Function onTap;

  BookCard({this.imageSource, this.title, this.writer, this.rating, this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            width: width * 0.23,
            height: height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 0),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imageSource),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10.0
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              writer,
              style: TextStyle(
                color: Color(0xFF848484),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 8.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 13.0,
                  color: Color(0xFF32E2A2),
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
