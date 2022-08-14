import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/Hadeth_Tab.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:islami_app/home/quran/Quran_Tab.dart';
import 'package:islami_app/home/radio/Radio_Tab.dart';
import 'package:islami_app/home/sebha/Sebha_Tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.getMainBackGround()))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                fontSize: 30,
                fontWeight: FontWeight.w500),
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            selectedIconTheme:
                Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
            unselectedIconTheme:
                Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
            selectedLabelStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: AppLocalizations.of(context)!.quran_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: AppLocalizations.of(context)!.tasbeh_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting_title)
            ],
          ),
          body: tabs[selectedIndex]),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
}
