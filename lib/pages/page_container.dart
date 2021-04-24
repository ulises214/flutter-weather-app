import 'package:basic_wheater_app/controllers/theme_controller.dart';
import 'package:basic_wheater_app/pages/fav_page.dart';
import 'package:basic_wheater_app/pages/home_page.dart';
import 'package:basic_wheater_app/pages/nav_bar.dart';
import 'package:basic_wheater_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();

    return Obx(() {
      final appColors = themeCtrl.appColors.value;

      return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appColors.background,
          bottomNavigationBar: PageNavigation(),
          body: SafeArea(
            child: TabBarView(
              children: [
                HomePage(),
                FavPage(),
                SettingsPage(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
