import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun/Themes/themes.dart';
import 'package:islami_sun/home/hadeth/HadtehTab.dart';
import 'package:islami_sun/home/quran/QuranTab.dart';
import 'package:islami_sun/home/radio/RadioTab.dart';
import 'package:islami_sun/home/settings/SettingsTab.dart';
import 'package:islami_sun/home/tasbeh/TasbehTab.dart';
import 'package:islami_sun/main.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.themeMode == ThemeMode.light
              ? 'assets/images/main_background.png'
              : 'assets/images/main_background_dark.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              currentPage = index;
              setState(() {});
            },
            backgroundColor: MyThemeData.primaryColor,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon:
                      const ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: const ImageIcon(
                      AssetImage('assets/images/ic_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon:
                      const ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              // BottomNavigationBarItem(
              //     backgroundColor: Theme.of(context).primaryColor,
              //     icon:
              //         const ImageIcon(AssetImage('assets/images/ic_radio.png')),
              //     label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.settings),
                  label: 'Settings'),
            ],
          ),
          body: Container(
            child: views[currentPage],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    // RadioTab(),
    const SettingsTab()
  ];
}
