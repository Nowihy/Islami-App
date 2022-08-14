import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/Hadeth_Tab.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import 'hadeth_details.dart';

class HadethNameWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethNameWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 6),
          child:
              Text(hadeth.title, style: Theme.of(context).textTheme.bodyText1)),
    );
  }
}
