// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';
import '../themeData.dart';



class SuraDetails extends StatefulWidget {
  static String routeName = "sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];
  String suraName='';
   String suraContent='';

  @override
  Widget build(BuildContext context) {
      AppProvider appProvider=Provider.of(context);
    double h=MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    double containerHight=h*0.75;
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if(suraLines.isEmpty) readFile(args.fileName);

    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(appProvider.isDarkThemeEnable ?"assets/dark_bg.png":"assets/default_bg.png"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.islami,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor),)),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
              height:containerHight,
                width: w * 0.85,
            decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [appProvider.isDarkThemeEnable? AppColores.primaryDarkColor: Colors.white.withOpacity(0.2),appProvider.isDarkThemeEnable? AppColores.primaryDarkColor: Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(
                    height: h * 0.05,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "سوره ${args.suraName}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font2"),
                      ),
                       Icon(
                        Icons.play_circle,
                        size: 45,
                        color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:Colors.black
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 3,
                    color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor,
                    padding: const EdgeInsets.only(left: 5),
                  ),
                  const SizedBox(height: 8,),

                   SizedBox(
                    height: containerHight-containerHight*0.2,
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                          suraContent.isEmpty?
            const Center(child: CircularProgressIndicator()):
             SingleChildScrollView(child: Padding(
             padding: const EdgeInsets.all(10.0),
                  child: Text(suraContent,style: TextStyle(fontSize: 25,color:appProvider.isDarkThemeEnable?AppColores.accentDarkColor: AppColores.accentColor,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,)))
                         ],
                         
                         
                       ),
                     ),
                   ),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void readFile(String fileName) async{
    suraContent = await rootBundle.loadString("assets/files/$fileName");
   suraLines = suraContent.trim().split("\n");
   setState(() {});
  }
}

class SuraDetailsArgs{
  String suraName;
  String fileName;
  SuraDetailsArgs({required this.suraName,required this.fileName});
}