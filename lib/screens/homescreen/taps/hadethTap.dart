// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../themeData.dart';
import '../../hadethDetails.dart';



// ignore: must_be_immutable
class HadethTap extends StatelessWidget {
   
  List<int>hadethName=List.generate(50,((index) => index));

  HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset("assets/hadeth_logo.png")),
          const SizedBox(height: 4,),
          Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
          Text(AppLocalizations.of(context)!.hadethName,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
           Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
           Expanded(
            flex: 7,
            child:ListView.builder(
              itemBuilder: (context, index) {
                return buildhadethName(context,index) ;
              },
              itemCount: hadethName.length,
              ))            
        
          
          
      ],
    );
  }
  Widget buildhadethName(BuildContext context ,int index){
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, HadethDetails.routeName,
        arguments:index
      
        );
      }, 
      child: Text("${index+1}حديث رقم",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,));
  }
}