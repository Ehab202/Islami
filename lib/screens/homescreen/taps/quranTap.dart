// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../themeData.dart';
import '../../suraDetalis.dart';


// ignore: must_be_immutable
class QuranTap extends StatelessWidget {
   QuranTap({super.key});
  List<String>suraName=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
            ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
            ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
            ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
            ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
            ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
            ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
            ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
            ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
            "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset("assets/qur2an_screen_logo.png")),
          const SizedBox(height: 4,),
          Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
          Text(AppLocalizations.of(context)!.suraName,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
           Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
           Expanded(
            flex: 7,
            child:ListView.builder(
              itemBuilder: (context, index) {
                return buildSuraName(context,suraName[index],index) ;
              },
              itemCount: suraName.length,
              ))            
        
          
          
      ],
    );
  }
  Widget buildSuraName(BuildContext context ,String suraName ,int index){
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, SuraDetails.routeName,
        arguments:SuraDetailsArgs(suraName: suraName, fileName: "${index + 1}.txt")
        );
      }, 
      child: Text(suraName,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,));
  }
}