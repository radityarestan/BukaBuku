class Book {
  String _imageSource;
  String _pdfSource;
  String _title;
  String _realTitle;
  String _writer;
  double _rating;

  Book({String imageSource, String pdfSource, String title, String realTitle, String writer, double rating}) {
    _imageSource = imageSource;
    _pdfSource = pdfSource;
    _title = title;
    _realTitle = realTitle;
    _writer = writer;
    _rating = rating;
  }

  String get imageSource => _imageSource;
  String get pdfSource => _pdfSource;
  String get title => _title;
  String get realTitle => _realTitle;
  String get writer => _writer;
  double get rating => _rating;


}