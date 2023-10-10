import 'package:books/app/data/constraint/fonts.dart';
import 'package:books/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Center(
                child: Text(
              "Perpustakaan",
              style: headerBold.copyWith(color: Colors.black),
            )),
            Center(
                child: Text(
              "Perpustakaan Online Indonesia",
              style: smallRegular.copyWith(color: Colors.black),
            )),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Color(0xFF254E7A)),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Masuk",
                          style: normalBold.copyWith(
                              fontSize: 28, color: Colors.white),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Email",
                          style: smallBold.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Masukan Email",
                              filled: true,
                              fillColor: const Color(0xFFF5FAFF),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEAECF0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFEAECF0), width: 2))),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Password",
                          style: smallBold.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Masukan password",
                              filled: true,
                              fillColor: const Color(0xFFF5FAFF),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEAECF0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFEAECF0), width: 2))),
                        ),
                        SizedBox(
                          height: 140,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 30,
                              width: 162,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Color(0xFFCBE3EF),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: Text(
                                  "Daftar",
                                  style: smallSemibold.copyWith(
                                      color: Color(0xFF254E7A)),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 162,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Color(0xFFCBE3EF),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.DASHBOARD);
                                },
                                child: Text(
                                  "Masuk",
                                  style: smallSemibold.copyWith(
                                      color: Color(0xFF254E7A)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
