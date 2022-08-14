import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Splash_Screen.dart';
import 'package:islami_app/home/Home_Screen.dart';
import 'package:islami_app/home/hadeth/hadeth_details.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:islami_app/home/quran/sura_details.dart';
import 'package:islami_app/myTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingsProvider>(
      create: (buildContext) {
        return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingProvider;

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of<SettingsProvider>(context);
    getValueFromShared();
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        SplashScreen.routeName: (_) => SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.currentLang),
    );
  }

  void getValueFromShared() async {
    final pref = await SharedPreferences.getInstance();
    settingProvider.changeLanguage(pref.getString('lang') ?? 'ar');

    if (pref.getString('theme') == 'light') {
      settingProvider.changeTheme(ThemeMode.light);
    } else if (pref.getString('theme') == 'dark') {
      settingProvider.changeTheme(ThemeMode.dark);
    }
  }
}
