import 'package:basic_wheater_app/controllers/theme_controller.dart';
import 'package:basic_wheater_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SettingsTop(),
          Padding(padding: EdgeInsets.only(top: 32.0), child: Stats()),
          Expanded(child: SettingOptions()),
        ],
      ),
    );
  }
}
