// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../themeData.dart';



class SebhaTap extends StatefulWidget {

  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}
List<String>zakr=[
"سبحان الله",
"الحمد لله",
"الله اكبر ",
"استغفر الله",
"لاحول ولا قوه الا بالله",
"اللهم صلي علي سيدنا محمد",
"لا اله الا الله وحده لاشريك له له الملك وله الحمد وهو علي كل شي قدير",
];
int index=0;
int counter=0;
double rotate=0.0;

class _SebhaTapState extends State<SebhaTap> {
  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: w,
            height: h*0.3,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset("assets/head_sebha_logo.png",width: w*0.12,),
                Positioned(
                  height: h*0.3,
                  child:   Transform.rotate(
                    angle: rotate,
                    child: Image.asset("assets/body_sebha_logo.png",width: w*0.4,height: h*0.2,)),
                )
              ],
            ),
          ),
          SizedBox(height: h*0.05,),
          const Text("عدد التسبيحات",style: TextStyle(fontSize: 22),),
          SizedBox(height: h*0.05,),
          Container(
            padding: EdgeInsets.all(w*0.07),
            decoration: BoxDecoration(
              color: const Color.fromARGB(191, 183, 146, 95),
              borderRadius: BorderRadius.circular(22)
            ),
            child:  Text('$counter',style: const TextStyle(fontSize: 22),),
          ),
          SizedBox(height: h*0.05,),
          InkWell(
            onTap:() {
              zekrCounter();

            }, 
            child: Container(
              padding: EdgeInsets.all(w*0.02),
              decoration: BoxDecoration(
                color: AppColores.primaryColor,
                borderRadius: BorderRadius.circular(22)
              ),
              child: 
               Text(zakr[index],style: const TextStyle(fontSize: 22),),
            ),
          ),
        ],
      ),
    
    );
    
  }
  zekrCounter(){
    rotate+=0.1;
    counter++;
    if (counter==33) {
      index++;
      counter=0;  
    }
    if (index>6) {
      index=0;
    }
    setState(() {
      
    });
  }
  

}