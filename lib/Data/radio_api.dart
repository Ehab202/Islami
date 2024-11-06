import 'dart:convert';

import 'package:http/http.dart'as http;
import '../models/RadioResponce.dart';

Future<RadioResponce>getRadio()async{
  http.Response response =await http.get( Uri.parse("https://mp3quran.net/api/v3/radios?lanuage=ar"));
  RadioResponce radioResponce= RadioResponce.fromJson(jsonDecode(response.body));
  if(response.statusCode >= 200 && response.statusCode < 300){
    return radioResponce;
  }else {
    throw Exception(radioResponce.massage?? "Something went wrong please try again later");
  }
}