import 'dart:convert';

import 'package:books/app/data/models/books.dart';
import 'package:http/http.dart' as http;

class ApiBook {

  static Future<List?> fetchBookData() async {
    Uri url = Uri.parse("https://book-484c7-default-rtdb.firebaseio.com/buku.json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return bookModelsFromJson(response.body);
    } else{
      return null;
    }
  }
}
