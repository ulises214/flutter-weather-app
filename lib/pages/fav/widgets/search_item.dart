part of fav_widgets;

class SearchItem extends StatelessWidget {
  final SearchableCity city;
  final Color colorText;
  final Color backgroundColor;
  final ThemedIcons themedIcons;
  final VoidCallback onClick;
  SearchItem({
    required this.city,
    required this.colorText,
    required this.backgroundColor,
    required this.themedIcons,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    city.location.city,
                    style: TextStyle(color: colorText),
                  ),
                ),
                Text(
                  city.location.country,
                  style: TextStyle(color: colorText),
                ),
                Image(
                  width: 36,
                  image: AssetImage(
                    themedIcons.find(city.iconName.assetImage).x48,
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
