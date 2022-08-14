import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.light);
              },
              child: settingsProvider.isDarkMode()
                  ? getUnSelectedItem(AppLocalizations.of(context)!.light)
                  : getSelectedItem(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 16,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.dark);
              },
              child: settingsProvider.isDarkMode()
                  ? getSelectedItem(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItem(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
