import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/Hadeth_Tab.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  //List<Hadeth> allHadeth = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    //if (allHadeth.isEmpty) readHadethFile(args.index);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(provider.getMainBackGround()))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Text(
                args.index,
                style: Theme.of(context).textTheme.bodyText2,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ));
  }

// void readHadethFile(int index) async {
//   String content = await rootBundle.loadString('assets/files/ahadeth.txt');
//   List<Hadeth> ahadethOfFile = [];
//   List<String> ahadeth = content.trim().split("#");
//   for (int i = 0; i < ahadeth.length; i++) {
//     List<String> hadethlines = ahadeth[i].trim().split('\n');
//     String title = hadethlines[0];
//     if (title.isEmpty) continue;
//     hadethlines.removeAt(0);
//     String content = hadethlines.join('\n');
//     Hadeth h = Hadeth(title, content);
//     ahadethOfFile.add(h);
//   }
//   allHadeth = ahadethOfFile;
//   setState(() {});
// }
}

// class HadethDetailsArgs {
//   int index;
//   String title;
//
//   HadethDetailsArgs(this.index, this.title);
// }
