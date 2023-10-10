import 'dart:math';

import 'package:books/app/data/constraint/fonts.dart';
import 'package:books/app/data/models/books.dart';
import 'package:books/app/modules/home/controllers/home_controller.dart';
import 'package:books/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  final homeCont = Get.find<HomeController>();
  final book = Get.arguments as BookModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku',
            style: largeBold.copyWith(color: Color(0xFF254E7A))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.DASHBOARD);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xFF254E7A),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 283,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("${book.gambar}"))
                ),
              ),
            ),
            SizedBox(height: 23,),
            Center(
              child: Container(
                height: 33,
                width: 205,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Color(0xFF254E7A)
                    ),
                    onPressed: () {
                      final booktoAdd = book;
                      homeCont.addToCart(booktoAdd);
                }, child: Text("Masukan Keranjang",style: smallRegular.copyWith(fontSize: 13),)),
              ),
            ),
            SizedBox(height: 35,),
            Text("${book.judul}",style: normalBold,),
            SizedBox(height: 5,),
            Text("Penulis: ${book.penulis}",style: smallRegular,),
            // Text("Penerbit: ${book.penerbit}",style: smallRegular,),
            Text("Tahun Terbit: ${Random}",style: smallRegular,),
            SizedBox(height: 60,),
            Text("Sinopsis",style: normalBold,),
            SizedBox(height: 5,),
            Text("Penulis: ${book.sinopsis}",style: smallRegular,),

          ],
        ),
      )
    );
  }
}
