// ignore_for_file: must_be_immutable., prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:islami/provider/app_provider.dart';
import 'package:islami/screens/homescreen/taps/quranTap.dart';
import 'package:islami/screens/homescreen/taps/radioTap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/screens/homescreen/taps/settinges.dart';
import 'package:provider/provider.dart';
import '../../themeData.dart';
import 'taps/hadethTap.dart';
import 'taps/sebhaTap.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTapIndex = 0;
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    const RadioTap(),
    SettingsTap()
  ];

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(appProvider.isDarkThemeEnable ?"assets/dark_bg.png":"assets/default_bg.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
          body: taps[selectedTapIndex],
          appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.islami,
                style: TextStyle(
                   ),
              )),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: AppColores.primaryColor),
            child: BottomNavigationBar(
                onTap: (index) {
                  selectedTapIndex = index;
                  setState(() {});
                },
                currentIndex: selectedTapIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icon_quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icon_hadeth.png")),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icon_sebha.png")),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/icon_radio.png")),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
                ]),
          )),
    );
  }
}
