import 'package:books/app/data/constraint/fonts.dart';
import 'package:books/app/data/models/books.dart';
import 'package:books/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 24,right:24 ,top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 54,
                  width: 164,
                  child: Text("Find Your Favorite Book",
                      style: mediumBold.copyWith(color: Color(0xFF254E7A)))),
              CircleAvatar(
                radius: 20,
                child: Image.asset("assets/images/profile.png"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 43,
                width: 292,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: SearchBar(
                  leading: Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Search Book",
                  hintStyle: MaterialStatePropertyAll(smallerRegular),
                  elevation: MaterialStatePropertyAll(0),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                        color: Color(0xFF254E7A),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 23,
                      height: 23,
                      decoration: BoxDecoration(
                          color: Color(0xFF254E7A),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/icon_settings.png")),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                  // Image.asset("assets/images/iconsettings.png",height: 20,width: 20,)
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Lanjutkan Membaca",
                  style: smallersemibold.copyWith(color: Color(0xFF254E7A))),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xFF254E7A),
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          FutureBuilder<List<BookModels>>(
            future: controller.fetchBooksNext(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Tampilkan loading indicator selama data dimuat
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final bookList = snapshot.data; // Ambil data buku dari snapshot
                return Container(
                  height: 145,
                  width: 413,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookList!.length,
                    itemBuilder: (context, index) {
                      final book = bookList[index];
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print(book.jenisBuku);
                              Get.toNamed(Routes.DETAILBOOK,
                                  arguments: bookList[index]);
                            },
                            child: Container(
                              width: 95,
                              height: 145,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: NetworkImage("${book.gambar}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 32,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryBook.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedCategoryBook.value = index;
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: controller.selectedCategoryBook.value == index
                              ? Color(0xFF254E7A)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                            child: Text(
                          "${controller.categoryBook[index]}",
                          style: smallersemibold.copyWith(
                              color:
                                  controller.selectedCategoryBook.value == index
                                      ? Colors.white
                                      : Color(0xFF254E7A)),
                        )),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Expanded(
            child: FutureBuilder<List<BookModels>>(
              future: controller.fetchBooksNext(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  ); // Tampilkan loading indicator selama data dimuat
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final bookList =
                      snapshot.data; // Ambil data buku dari snapshot
                  return GridView.count(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    // Jumlah kolom
                    crossAxisSpacing: 16.0,
                    // Spacing between columns
                    mainAxisSpacing: 23.0,
                    // Spacing between rows
                    children: List.generate(bookList!.length, (index) {
                      final book = bookList[index];
                      return InkWell(
                        onTap: () {
                          print(book.jenisBuku);
                          Get.toNamed(Routes.DETAILBOOK,
                              arguments: bookList[index]);
                        },
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 168, // Lebar Container
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 13, right: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 121,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${book.gambar}"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star_border_rounded,size: 19),
                                              Text(
                                                "${book.rating}",
                                                style: smallerRegular.copyWith(
                                                    color: Color(0xFF484848)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Color(0xFF5584B0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Center(
                                                  child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      "${book.jenisBuku}",
                                                      style: smallerRegular
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                      ),
                                                      maxLines: 1)),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${book.judul}",
                                    style: smallSemibold.copyWith(
                                        color: Color(0xFF254E7A)),
                                    maxLines: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: 120,
                                          child: Text(
                                            "${book.penulis}",
                                            style: smallerRegular.copyWith(
                                                color: Color(0xFF484848),
                                                fontSize: 11),
                                            maxLines: 1,
                                          )),
                                      InkWell(
                                          onTap: () {
                                            print("klik");
                                          },
                                          child: Icon(
                                            Icons.bookmark_outline_outlined,
                                            color: Color(0xFF254E7A),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
    );
  }
}
