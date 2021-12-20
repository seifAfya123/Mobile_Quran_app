import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun/Themes/themes.dart';
import 'package:islami_sun/home/hadeth/hadeth_name_widget.dart';
import 'package:islami_sun/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun/providers/AppConfig.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (allHadeth.isEmpty) parseHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/hadeth_top_logo.png')),
        Container(
          height: MediaQuery.of(context).size.width * 0.01,
          color: MyThemeData.primaryColor,
        ),
        ////////////////////////////////////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.ahadeth,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: provider.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width * 0.01,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
            flex: 3,
            child: allHadeth.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return HadethNameWidget(
                          allHadeth[index],
                          provider.themeMode == ThemeMode.light
                              ? Colors.black
                              : Colors.white);
                    },
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        height: 1,
                        color: MyThemeData.primaryColor,
                      );
                    },
                    itemCount: allHadeth.length))
      ],
    );
  }

  void parseHadethFile() async {
    List<HadethItem> ahadtheData = [];
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = fileContent.trim().split('\n#');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].trim().split('\n');
      if (hadethLines[0].isEmpty) {
        hadethLines.removeAt(0);
      }
      String title = hadethLines[0];
      String content = '';
      for (int j = 1; j < hadethLines.length; j++) {
        content += hadethLines[j] + ' ';
      }
      // print('title $title');
      // print('content $content');
      HadethItem item = HadethItem(title, content);
      ahadtheData.add(item);
    }
    setState(() {
      allHadeth = ahadtheData;
    });
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}
