import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeth/hadeth_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth = [];

  //allHadeth = hadethfile
  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) readHadethFile();

    return Column(
      children: [
        Image.asset('assets/images/hadeth_header.png'),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ))),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.headline5),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return HadethNameWidget(allHadeth[index]);
            },
            itemCount: allHadeth.length,
          ),
        ),
      ],
    );
  }

  void readHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<Hadeth> ahadethOfFile = [];
    List<String> ahadeth = content.trim().split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethlines = ahadeth[i].trim().split('\n');
      String title = hadethlines[0];
      if (title.isEmpty) continue;
      hadethlines.removeAt(0);
      String content = hadethlines.join('\n');
      Hadeth h = Hadeth(title, content);
      ahadethOfFile.add(h);
    }
    allHadeth = ahadethOfFile;
    setState(() {});
  }
}

class Hadeth {
  String title;
  String index;

  Hadeth(this.title, this.index);
}
