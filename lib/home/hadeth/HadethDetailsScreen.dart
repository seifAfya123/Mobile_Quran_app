import 'package:flutter/material.dart';
import 'package:islami_sun/Themes/themes.dart';
import 'package:islami_sun/home/hadeth/HadtehTab.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethItem;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(children: [
      Image.asset(
        provider.themeMode == ThemeMode.light
            ? 'assets/images/main_background.png'
            : 'assets/images/main_background_dark.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 96, horizontal: 24),
            decoration: BoxDecoration(
                color: provider.themeMode == ThemeMode.light
                    ? Colors.white
                    : MyThemeData.DarkprimaryColor,
                borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Text(
                args.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: provider.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
