import 'package:books/app/data/constraint/fonts.dart';
import 'package:books/app/modules/home/controllers/home_controller.dart';
import 'package:books/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/carts_controller.dart';

class CartsView extends GetView<CartsController> {
  final homeCont = Get.find<HomeController>();

  CartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Keranjang Peminjaman Buku',
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Color(0xFF254E7A),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 54, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Perpustakaan Online",
                  style: normalSemibold.copyWith(color: Colors.white),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/images/profile.png"),
                    ),
                    SizedBox(width: 10,),
                    Text("Yanuarin Salwa",
                      style: smallSemibold.copyWith(color: Colors.white),)
                  ],
                ),
                SizedBox(height: 34,),
                Text("Daftar buku dipinjam",
                  style: normalSemibold.copyWith(color: Colors.white),),
                SizedBox(height: 34,),
                Expanded(child: Obx(() {
                  return ListView.builder(
                    itemCount: homeCont.cartItems.length,
                    itemBuilder: (context, index) {
                      final book = homeCont.cartItems[index];
                      return Container(
                        height: 80,
                        width: 90,
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: NetworkImage("${book.gambar}"),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                                width: 150,
                                height: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${book.judul}",
                                      style: smallSemibold.copyWith(
                                        color: Colors.white,), maxLines: 1,),
                                    Text("${book.penulis}",
                                      style: smallRegular.copyWith(
                                        fontSize: 11, color: Colors.white,),
                                      maxLines: 1,),
                                    Text("Tahun Terbit 2023-${book.jenisBuku}",
                                      style: smallRegular.copyWith(
                                        fontSize: 11, color: Colors.white,),
                                      maxLines: 1,),
                                  ],
                                )),
                            SizedBox(width: 75,),
                            Obx(() {
                              return IconButton(onPressed: () {
                                homeCont.removeFromCart(book);
                              },
                                icon: controller.isConfirmation.value
                                    ? Text("")
                                    : Icon(
                                    Icons.delete_forever_rounded, size: 35),
                                color: Colors.white,
                                iconSize: 40,);
                            })
                          ],
                        ),
                      );
                    },
                  );
                })
                ),
                Container(
                  height: 150,
                  child: Center(
                    child: Obx(
                          () =>
                      controller.isConfirmation.value
                          ? Obx(() => controller.isCompleted.value ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Syarat dan Ketentuan", style: normalSemibold
                                .copyWith(color: Colors.white),),
                            Row(
                              children: [
                                Obx(() {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.white,
                                    ),
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.isYes.value,
                                      onChanged: (value) {
                                        controller.toggleSyarat();
                                      },),
                                  );
                                }),
                                Text(
                                  "Dengan ini saya menyetujui syarat dan ketentuan",
                                  style: smallRegular.copyWith(
                                      color: Colors.white, fontSize: 10),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 34,
                                  width: 162,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      controller.toggleConfirmation();
                                    },
                                    child: Text(
                                      "Batal",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF254E7A),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16), // Spasi antara tombol
                                Container(
                                  height: 34,
                                  width: 162,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Color(0xFFCBE3EF),
                                    ),
                                    onPressed: () {
                                      controller.toggleCompleted();
                                    },
                                    child: Text(
                                      "Setuju",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF254E7A),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ) : Column(
                        children: [
                          Text("Peminjaman Berhasil ",style: normalSemibold.copyWith(color: Colors.white),),
                          SizedBox(height: 14,),
                          Text("Jangan Lupa dikembalikan keperpustakaan ya! ",style: smallRegular.copyWith(fontSize: 11,color: Colors.white),),
                          SizedBox(height: 25,),
                          Container(
                            height: 34,
                            width: 162,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Color(0xFFCBE3EF),
                              ),
                              onPressed: () {
                              },
                              child: Text(
                                "Oke",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF254E7A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      )
                          : Container(
                        height: 34,
                        width: 162,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Color(0xFFCBE3EF),
                          ),
                          onPressed: () {
                            controller.toggleConfirmation();
                          },
                          child: Text(
                            "Konfirmasi",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF254E7A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
