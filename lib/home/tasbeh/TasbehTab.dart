import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_sun/Themes/themes.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int _tasbeh_count = 0;
  double _angle = 0;
  int _text_index = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // _tasbeh_count = provider.tasbeh_count;
    List<String> _tasbehat_text = [
      AppLocalizations.of(context)!.sobhanallah,
      AppLocalizations.of(context)!.elhmdulah,
      AppLocalizations.of(context)!.laelahelaallah,
    ];
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            child: Text(
              AppLocalizations.of(context)!.tasbeh,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: provider.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          Stack(
            // mainA/xisAlignment: MainAxisAlignment.start,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 0.266,
                child: Container(
                  child: Image(
                    image: AssetImage(
                      provider.themeMode == ThemeMode.light
                          ? 'assets/images/head_sebha_logo.png'
                          : 'assets/images/head_sebha_dark.png',
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // provider.set_new_tasbeh_count(_tasbeh_count);
                  _increment_tasbeh_Count();
                },
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.09),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    child: Transform.rotate(
                      angle: _angle,
                      child: Image(
                        image: AssetImage(
                          provider.themeMode == ThemeMode.light
                              ? 'assets/images/body_sebha_logo.png'
                              : 'assets/images/body_sebha_dark.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              // color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.addtsbehat,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.w600,
                      color: provider.themeMode == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Text(
                      _tasbeh_count.toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontWeight: FontWeight.w600,
                        color: provider.themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: provider.themeMode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.DarkprimaryColor,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.05)),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      _tasbehat_text[_text_index],
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontWeight: FontWeight.w600,
                        color: provider.themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: provider.themeMode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkAccentColor,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.05)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
          )
        ],
      ),
    );
  }

  void _settext() {
    if (_tasbeh_count == 33) {
      _angle = 0;
      _tasbeh_count = 0;
      if (_text_index != 2) {
        _text_index++;
      } else {
        _text_index = 0;
      }
    }
  }

  void _increment_tasbeh_Count() {
    setState(() {
      _settext();
      _tasbeh_count++;
      _angle += (360 / 33) * pi / 180;
    });
  }
}
