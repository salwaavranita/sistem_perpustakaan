import 'package:books/app/modules/carts/views/carts_view.dart';
import 'package:books/app/modules/home/views/home_view.dart';
import 'package:books/app/modules/profile/views/profile_view.dart';
import 'package:books/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeView(),
            CartsView(),
            SearchView(),
            ProfileView()
          ],
        )),
        bottomNavigationBar:   BottomNavigationBar(
            selectedItemColor: Color(0xFF262626),
            unselectedItemColor: Color(0xFF6F6F6F),
            onTap: (value) => controller.changeTabIndex(value),
            currentIndex: controller.tabIndex,
            backgroundColor: Colors.redAccent,
            items:  [
              _bottomNavigatorBarItem(Icons.home, "Home"),
              _bottomNavigatorBarItem(Icons.shopping_cart, "cart"),
              _bottomNavigatorBarItem(Icons.search_outlined, "search"),
              _bottomNavigatorBarItem(Icons.person, "search"),
            ]
        ),
      );
    },);
  }
  _bottomNavigatorBarItem(IconData icon,String label){
    return BottomNavigationBarItem(icon: Icon(icon),
      label: label,
    );
  }
}
