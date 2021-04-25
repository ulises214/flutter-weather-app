part of pages_library;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () {
        final appColors = themeCtrl.appColors.value;
        return Column(
          children: [
            TopBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stats(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TimeLine(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 32.0, bottom: 16.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: appColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      DayWeather(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: WeekWeather(),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TextButton(
            //         onPressed: () => themeCtrl.change(ThemeColor.DARK),
            //         child: Text('Color dark')),
            //     TextButton(
            //         onPressed: () => themeCtrl.change(ThemeColor.LIGHT),
            //         child: Text('Color light')),
            //   ],
            // )
          ],
        );
      },
    );
  }
}
