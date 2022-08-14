import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  String content;
  int index;

  VerseWidget(this.index, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Text('$content{${index + 1}} ',
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl),
    );
  }
}
