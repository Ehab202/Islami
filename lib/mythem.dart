import 'package:flutter/material.dart';
import 'package:islami/themeData.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColores.primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColores.accentColor),
        elevation: 0,
        centerTitle: true,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColores.accentColor,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30)
    ),
    textTheme: TextTheme(
      bodyLarge:TextStyle( fontSize: 26,fontWeight: FontWeight.w500,color: AppColores.accentColor),
      bodyMedium: TextStyle(fontWeight: FontWeight.bold,color:AppColores.accentColor,fontSize: 25),  
    ),
    );
  static ThemeData darkTheme = ThemeData(
       primaryColor: AppColores.primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColores.accentDarkColor,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      unselectedItemColor: Colors.white
    ),
    textTheme: const TextTheme(
      bodyLarge:TextStyle( fontSize: 26,fontWeight: FontWeight.w500,color: Colors.white),
      bodyMedium: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 25), 
    ),
    
      );
}
