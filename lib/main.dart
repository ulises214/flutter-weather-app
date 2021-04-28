import 'package:basic_wheater_app/widgets/widgets.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:basic_wheater_app/pages/pages_library.dart';
import 'package:basic_wheater_app/controllers/controlers_library.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final themeCtrl = Get.put(ThemeController());
  final languageCtrl = Get.put(LanguageController());
  final weatherCtrl = Get.put(WeatherController());
  final secondaryCitiesCtrl = Get.put(SearchCitiesController());
  final cron = Cron();

  MyApp() {
    cron.schedule(Schedule.parse('* */15 * * * *'), () => _cronWeather());
  }

  Future<bool?>? hasLocationPermision() async {
    return await Permission.location.request().isGranted;
  }

  void _cronWeather() {
    // weatherCtrl.updateMainCity(currentUnits ?? MeasurementUnits.METRIC);
    // print('Every 1 minute $currentUnits');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        _changeStatusBarColors(themeCtrl);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          routes: {
            '/': (_) => FutureBuilder(
                  initialData: false,
                  future: hasLocationPermision(),
                  builder: (context, AsyncSnapshot<bool?> snapshot) {
                    return snapshot.data == true
                        ? PageContainer()
                        : ThemedCircularProgressIndicator();
                  },
                )
          },
          initialRoute: '/',
        );
      },
    );
  }
}

void _changeStatusBarColors(ThemeController themeCtrl) =>
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: themeCtrl.appColors.value.background,
        statusBarIconBrightness: themeCtrl.brightness.value,
        systemNavigationBarColor: themeCtrl.appColors.value.card,
        systemNavigationBarIconBrightness: themeCtrl.brightness.value,
        systemNavigationBarDividerColor: themeCtrl.appColors.value.background,
      ),
    );
