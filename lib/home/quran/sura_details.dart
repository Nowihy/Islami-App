import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:islami_app/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) readfile(args.index);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(provider.getMainBackGround()))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return VerseWidget(index, verses[index]);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (_, index) {
                      return Container(
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 64),
                        height: 2,
                      );
                    },
                  ),
                ),
        ));
  }

  void readfile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.trim().split("\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  int index;
  String title;

  SuraDetailsArgs(this.index, this.title);
}
