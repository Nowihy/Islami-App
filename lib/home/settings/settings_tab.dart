import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:islami_app/home/settings/Theme_Bottom_Sheet.dart';
import 'package:islami_app/home/settings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).backgroundColor),
              child: Text(AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.headline4),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              ShowThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).backgroundColor,
              ),
              child: Text(
                  provider.isDarkMode()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.headline4),
            ),
          ),
        ],
      ),
    );
  }

  void ShowLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

  void ShowThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }
}
