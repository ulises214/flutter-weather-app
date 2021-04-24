part of custom_widgets;

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () {
        final colors = themeCtrl.appColors.value;
        return Container(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'San Francisco',
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '18°',
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 48,
                      ),
                    ),
                    Chip(
                      backgroundColor: colors.card,
                      shadowColor: colors.shadow,
                      elevation: 0,
                      label: Text(
                        'Day',
                        style: TextStyle(
                          color: colors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2,
                  child: Image(
                    height: 128,
                    width: 128,
                    image: AssetImage(themeCtrl.icons.value.day.x1024),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
