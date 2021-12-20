import 'package:flutter/material.dart';
import 'package:islami_sun/Themes/themes.dart';
import 'package:islami_sun/home/quran/SuraDetailsScreen.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

class SuraNameWidget extends StatelessWidget {
  String name;
  int index;
  Color textcolor;
  SuraNameWidget(this.name, this.index, this.textcolor);
// var provider = Provider.of<AppConfigProvider(context);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            child: Text(
              name,
              style: TextStyle(fontSize: 24, color: textcolor
                  // color: provider.themeMode == ThemeMode.light
                  //     ? Colors.black
                  //     : Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
