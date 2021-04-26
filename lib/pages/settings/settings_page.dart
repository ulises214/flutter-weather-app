part of pages_library;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
