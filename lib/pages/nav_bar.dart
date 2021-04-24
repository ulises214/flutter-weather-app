import 'package:basic_wheater_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PageNavigation extends StatefulWidget {
  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TabBar(
            labelColor: themeCtrl.appColors.value.accent,
            unselectedLabelColor: themeCtrl.appColors.value.icon,
            indicatorColor: themeCtrl.appColors.value.accent,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.all(4),
            tabs: [
              // FaIcon(FontAwesomeIcons.home),
              // FaIcon(FontAwesomeIcons.heart),
              // FaIcon(FontAwesomeIcons.bars),
              Icon(LineIcons.home, size: 28),
              Icon(LineIcons.heart, size: 28),
              Icon(LineIcons.bars, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
