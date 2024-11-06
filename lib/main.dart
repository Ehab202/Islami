import 'package:flutter/material.dart';
import 'package:islami/mythem.dart';
import 'package:islami/provider/app_provider.dart';
import 'package:islami/screens/hadethDetails.dart';
import 'package:islami/screens/homescreen/home.dart';
import 'package:provider/provider.dart';
import 'screens/suraDetalis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName: (context) => const Home(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      initialRoute: Home.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appProvider.isArEnable ? "ar" : "en"),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          appProvider.isDarkThemeEnable ? ThemeMode.dark : ThemeMode.light,
    );
  }
  
}

