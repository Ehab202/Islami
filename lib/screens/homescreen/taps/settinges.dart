import 'package:flutter/material.dart';
import 'package:islami/provider/app_provider.dart';
import 'package:islami/themeData.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  bool isArEnable = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of(context);
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10,),
             Text("language(ar) (العربيه)",style: TextStyle(color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor,fontWeight: FontWeight.w500,fontSize: 18),),
            const Spacer(),
            Switch(
              activeColor:  appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor,
              value: appProvider.isArEnable,
              onChanged: (value) {
              appProvider.changeCurrantLocala(value);
               
              },
            ),
            const SizedBox(width: 8,)
          ],
        ),
        Row(
           children: [
            const SizedBox(width: 10,),
             Text("TheTheme (الوضع الليلي)",style: TextStyle(color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor,fontWeight: FontWeight.w500,fontSize: 18),),
            const Spacer(),
            Switch(
              activeColor: AppColores.accentDarkColor,
              value: appProvider.isDarkThemeEnable,
              onChanged: (value) {
              appProvider.changeCurrantTheme(value);
               
              },
            ),
            const SizedBox(width: 8,)
          ],
        ),
      ],
    );
  }
}
