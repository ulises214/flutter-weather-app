import 'package:basic_wheater_app/pages/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:basic_wheater_app/controllers/theme_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final themeCtrl = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: themeCtrl.appColors.value.background,
            statusBarIconBrightness: themeCtrl.brightness.value,
            systemNavigationBarColor: themeCtrl.appColors.value.card,
            systemNavigationBarIconBrightness: themeCtrl.brightness.value,
            systemNavigationBarDividerColor:
                themeCtrl.appColors.value.background,
          ),
        );
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          routes: {'/': (_) => PageContainer()},
          initialRoute: '/',
        );
      },
    );
  }
}
