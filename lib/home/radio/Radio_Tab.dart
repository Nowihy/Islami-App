import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/radioimage.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'اذاعة القران الكريم',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage('assets/images/Icon metro-next.png'),
                  color: Theme.of(context).primaryColor,
                ),
                ImageIcon(
                  AssetImage('assets/images/Icon metro-play.png'),
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                ImageIcon(AssetImage('assets/images/Icon metro-previous.png'),
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
