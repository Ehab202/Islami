// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_provider.dart';
import '../themeData.dart';
import 'package:provider/provider.dart';



class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});
   static String routeName = "hadeth_details";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}
class _HadethDetailsState extends State<HadethDetails> {
  String hadethContent='';
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of(context);
    int args = ModalRoute.of(context)!.settings.arguments as int ;
     double h=MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    double containerHight=h*0.75;
    if(hadethContent.isEmpty) readFile(args);
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(appProvider.isDarkThemeEnable ?"assets/dark_bg.png":"assets/default_bg.png"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.islami,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:  appProvider.isDarkThemeEnable?AppColores.accentDarkColor:AppColores.accentColor),textAlign: TextAlign.center,),),
        body:Padding(
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
                      const Text(
                        "حديث شريف",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font2"),
                      ),
                      Icon(
                        Icons.play_circle,
                        size: 45,
                        color: appProvider.isDarkThemeEnable?AppColores.accentDarkColor:Colors.black,
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
                          hadethContent.isEmpty?
            const Center(child: CircularProgressIndicator()):
             SingleChildScrollView(child: Padding(
             padding: const EdgeInsets.all(10.0),
                  child: Text(hadethContent,style: TextStyle(fontSize: 25,color:appProvider.isDarkThemeEnable?AppColores.accentDarkColor: AppColores.accentColor,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,)))
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
  void readFile(int index) async{
    hadethContent = await rootBundle.loadString("assets/hadethFiles/h${index+1}.txt");
    index++;
   setState(() {
   });
  }
}
