import 'package:buka_buku/components/book_card.dart';
import 'package:buka_buku/components/bottom_bar.dart';
import 'package:buka_buku/constant.dart';
import 'package:buka_buku/model/DataSearch.dart';
import 'package:buka_buku/model/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'book_reader.dart';

class HomePage extends StatefulWidget {
  final String userName;
  HomePage({this.userName});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();
    openPdf('pdf/Sample Book.pdf');
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/${asset.split('/')[1]}");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  void openPdf(String asset) {
    getFileFromAsset(asset).then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Selamat Pagi,',
                          style: kGreetingMessage,
                        ),
                        Text(
                          widget.userName != null
                              ? widget.userName
                              : "DEF 2020",
                          style: widget.userName != null
                              ? (widget.userName.length > 6
                                  ? kSmallGreetingName
                                  : kBigGreetingName)
                              : kBigGreetingName,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Container(
                      width: width * 0.3,
                      height: width * 0.3,
                      child: Image.asset('images/Profile Orang.png'),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showSearch(context: context, delegate: DataSearch());
                  },
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xFF30E2A1),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          'Ingin Buka Buku apa hari ini...',
                          style: kTextField,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int i = 0;
                          i < Books.listOfRecommendation.length;
                          i++)
                        i == Books.listOfRecommendation.length - 1
                            ? BookCard(
                                imageSource:
                                    Books.listOfRecommendation[i].imageSource,
                                title: Books.listOfRecommendation[i].title,
                                writer: Books.listOfRecommendation[i].writer,
                                rating: Books.listOfRecommendation[i].rating,
                                onTap: () {
                                  openPdf(
                                      Books.listOfRecommendation[i].pdfSource);

                                  if (assetPDFPath != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PdfViewPage(
                                                  path: assetPDFPath,
                                                  title: Books
                                                      .listOfRecommendation[i]
                                                      .realTitle,
                                                )));
                                  }
                                },
                              )
                            : Row(
                                children: <Widget>[
                                  BookCard(
                                    imageSource: Books
                                        .listOfRecommendation[i].imageSource,
                                    title: Books.listOfRecommendation[i].title,
                                    writer:
                                        Books.listOfRecommendation[i].writer,
                                    rating:
                                        Books.listOfRecommendation[i].rating,
                                    onTap: () {
                                      openPdf(Books
                                          .listOfRecommendation[i].pdfSource);

                                      if (assetPDFPath != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PdfViewPage(
                                                      path: assetPDFPath,
                                                      title: Books
                                                          .listOfRecommendation[
                                                              i]
                                                          .realTitle,
                                                    )));
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                ],
                              ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Populer',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int i = 0; i < Books.listOfPopular.length; i++)
                        i == Books.listOfPopular.length - 1
                            ? BookCard(
                                imageSource: Books.listOfPopular[i].imageSource,
                                title: Books.listOfPopular[i].title,
                                writer: Books.listOfPopular[i].writer,
                                rating: Books.listOfPopular[i].rating,
                                onTap: () {
                                  openPdf(Books.listOfPopular[i].pdfSource);
                                  if (assetPDFPath != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PdfViewPage(
                                                  path: assetPDFPath,
                                                  title: Books
                                                      .listOfRecommendation[i]
                                                      .realTitle,
                                                )));
                                  }
                                },
                              )
                            : Row(
                                children: <Widget>[
                                  BookCard(
                                    imageSource:
                                        Books.listOfPopular[i].imageSource,
                                    title: Books.listOfPopular[i].title,
                                    writer: Books.listOfPopular[i].writer,
                                    rating: Books.listOfPopular[i].rating,
                                    onTap: () {
                                      openPdf(Books.listOfPopular[i].pdfSource);
                                      if (assetPDFPath != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PdfViewPage(
                                                      path: assetPDFPath,
                                                      title: Books
                                                          .listOfRecommendation[
                                                              i]
                                                          .realTitle,
                                                    )));
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                ],
                              ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
            height: height,
          ),
        ],
      ),
    );
  }
}
