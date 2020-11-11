import 'package:buka_buku/constant.dart';
import 'package:buka_buku/model/book.dart';
import 'package:buka_buku/model/books.dart';
import 'package:buka_buku/screens/searching_result.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  static List<Book>booksResult = [
  ];
  
  final booksTitle = [
    'Selalu di Hati',
    'Tentang Dia',
    'Lelaki yang Tak Bisa Dicuri',
    '5 cm',
    'Pergi',
    'Garis Waktu',
    'Bumi Manusia',
    'Cantik Itu Luka',
  ];

  final recentBooks = [
  ];
  
  

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SearchingResult(result: booksResult,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentBooks
        : booksTitle.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          booksResult.clear();
          List<String> temporary = booksTitle.where((element) => element.startsWith(query)).toList();
          print(temporary);
          for(int i = 0; i < temporary.length; i++) {
            for (Book book in Books.totalBook) {
              if (temporary[i] == book.realTitle) {
                booksResult.add(book);
              }
            }
          }
          showResults(context);
        },
        leading: Icon(
          Icons.book,
          color: Color(0xFF30E2A1),
        ),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: kTextFieldBold,
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
