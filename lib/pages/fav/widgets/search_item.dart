part of fav_widgets;

class SearchItem extends StatelessWidget {
  final SearchableCity city;
  final ThemeController controller;

  final VoidCallback onClick;
  SearchItem({
    required this.city,
    required this.controller,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: controller.appColors.card,
        child: InkWell(
          onTap: () {
            Future.delayed(Duration(milliseconds: 100)).then((_) => onClick());
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: CustomText.body(city.location.city, controller),
                ),
                CustomText.bodySecondary(city.location.country, controller),
                Image(
                  width: 36,
                  image: AssetImage(
                    controller.icons.find(city.iconName.assetImage),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
