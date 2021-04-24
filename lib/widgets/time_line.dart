part of custom_widgets;

class CurvePainter extends CustomPainter {
  final Color lineColor;

  CurvePainter(this.lineColor);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final path = Path();
    // path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
    //         size.height / 4, size.width, size.height);
    path.cubicTo(size.width / 3, 0, size.width / 2, size.height, size.width,
        4 * size.height / 5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () {
        final icons = themeCtrl.icons.value;
        final day = icons.day.x1024, night = icons.night.x1024;
        final colors = themeCtrl.appColors.value;
        return Container(
          height: 100,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: Row(
                  children: [
                    Image(
                      width: 48,
                      height: 48,
                      image: AssetImage(day),
                    ),
                    Text(
                      '07:00 AM',
                      style: TextStyle(
                        color: colors.text,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: CustomPaint(
                  painter: CurvePainter(colors.text),
                  size: Size(double.infinity, 60),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '06:00 PM',
                      style: TextStyle(
                        color: colors.text,
                      ),
                    ),
                    Image(
                      width: 48,
                      height: 48,
                      image: AssetImage(night),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
