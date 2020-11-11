import 'package:buka_buku/components/login_button.dart';
import 'package:buka_buku/components/textfield_of_name.dart';
import 'package:buka_buku/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -height * 0.125,
            child: Container(
              width: width,
              child: Image.asset('images/Cover Image.png'),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width * 0.16,
                        height: width * 0.16,
                        child: Image.asset('images/Logo Buka Buku.png'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: width * 0.5,
                        height: width * 0.16,
                        child: Image.asset('images/Logo Tulisan Buka Buku.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFieldName(
                    width: width,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  LoginButton(
                    onPressed: () {
                      print(TextFieldName.userName);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            userName: TextFieldName.userName,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
