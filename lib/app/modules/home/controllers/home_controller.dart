import 'dart:convert';
import 'package:books/app/data/constraint/fonts.dart';
import 'package:flutter/material.dart';

import 'package:books/app/data/services/api_book.dart';
import 'package:get/get.dart';
import '../../../data/models/books.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt selectedCategoryBook = 0.obs;
  List<dynamic> categoryBook = ["All", "Romance", "Horor", "Thriller"];

  RxBool favoriteBook = false.obs;

  var isLoading = true.obs;
  var bookList = <BookModels>[].obs;

  @override
  void onInit() {
    fetchBook();
    super.onInit();
  }

  fetchBook() async {
    try {
      isLoading(true);
      var bookData = await ApiBook.fetchBookData();
      if (bookData != null) {
        bookList.value = bookData as List<BookModels>;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<BookModels>> fetchBooksNext() async {
    Uri url =
        Uri.parse("https://book-484c7-default-rtdb.firebaseio.com/buku.json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<BookModels> books = data.map((item) {
        return BookModels.fromJson(item);
      }).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  //====//
  RxList<BookModels> cartItems = <BookModels>[].obs;

  void addToCart(BookModels book) {
    cartItems.add(book);
    Get.snackbar(
      animationDuration: Duration(seconds: 1),
      " ",
      " ",
      backgroundColor: Color(0xFF254E7A),
      titleText: Center(
        child: Text(
          "Berhasil Menambahkan",
          style: smallBold.copyWith(color: Colors.white),
        ),
      ),
      messageText: Center(
        child: Text(
          "Silahkan ke Halaman Carts Untuk Menyewa Buku",
          style: smallSemibold.copyWith(fontSize: 11,color: Colors.white),
        ),
      ),
    );

  }

  void removeFromCart(BookModels book) {
    cartItems.remove(book);
    update();
  }
}
