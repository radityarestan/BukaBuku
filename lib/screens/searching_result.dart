import 'package:buka_buku/components/book_card.dart';
import 'package:buka_buku/model/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'book_reader.dart';
import 'dart:io';

class SearchingResult extends StatefulWidget {
  final List<Book> result;
  SearchingResult({this.result});
  @override
  _SearchingResultState createState() => _SearchingResultState();
}

class _SearchingResultState extends State<SearchingResult> {
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();
    openPdf('${widget.result[0].pdfSource}');
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

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                for (int i = 0; i < widget.result.length; i++)
                  i == widget.result.length - 1
                      ? BookCard(
                          imageSource: widget.result[i].imageSource,
                          title: widget.result[i].title,
                          writer: widget.result[i].writer,
                          rating: widget.result[i].rating,
                          onTap: () {
                            if (assetPDFPath != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfViewPage(
                                            path: assetPDFPath,
                                            title: widget.result[i].realTitle,
                                          )));
                            }
                          },
                        )
                      : Row(
                          children: <Widget>[
                            BookCard(
                              imageSource: widget.result[i].imageSource,
                              title: widget.result[i].title,
                              writer: widget.result[i].writer,
                              rating: widget.result[i].rating,
                              onTap: () {
                                if (assetPDFPath != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PdfViewPage(
                                                path: assetPDFPath,
                                                title:
                                                    widget.result[i].realTitle,
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
    );
  }
}
