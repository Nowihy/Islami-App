import 'package:flutter/material.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angular = 33;

  int counter = 0;

  List<String> askar = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * .4,
            child: Stack(
              children: [
                Positioned(
                  child: provider.isDarkMode()
                      ? Image.asset('assets/images/head of seb7a dark.png')
                      : Image.asset('assets/images/head of seb7a light.png'),
                  left: size.width * .48,
                ),
                Positioned(
                  child: InkWell(
                    onTap: onPressed,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Transform.rotate(
                      angle: angular,
                      child: provider.isDarkMode()
                          ? Image.asset('assets/images/body of seb7a dark.png')
                          : Image.asset(
                              'assets/images/body of seb7a light.png'),
                    ),
                  ),
                  top: 80,
                  left: size.width * .21,
                  right: size.width * .21,
                ),
              ],
            ),
          ),
          Container(
              child: Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyText1,
          )),
          SizedBox(height: 20),
          Container(
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDarkMode()
                    ? Color.fromRGBO(20, 26, 46, 1)
                    : Theme.of(context).primaryColor),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 51,
            width: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text('${askar[currentindex]}',
                style: Theme.of(context).textTheme.bodyText1),
            //alignment: Alignment.center,
          )
        ],
      ),
    );
  }

  onPressed() {
    counter++;
    if (counter == 33) {
      currentindex++;
      counter = 0;
    }
    if (currentindex > askar.length - 1) {
      currentindex = 0;
    }
    angular = angular - 50;
    setState(() {});
  }
}
