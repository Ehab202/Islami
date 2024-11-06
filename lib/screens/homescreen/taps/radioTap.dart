// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:islami/Data/radio_api.dart';
import 'package:islami/models/RadioResponce.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';
import '../../../themeData.dart';
import 'package:audioplayers/audioplayers.dart';
class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  final player=AudioPlayer();
  int index=0;
  bool isPlaying=false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider= Provider.of(context);
    return  SizedBox(
      width: double.infinity,
      child: FutureBuilder<RadioResponce>(
        future: getRadio(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator or placeholder while waiting for data
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle the error case
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            var data = snapshot.data!.radios ?? [];
            if (data.isEmpty) {
              // Handle the case where data is empty
              return const Text('No radio data available');
            }

            // Rest of your existing code
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset("assets/radio_image.png", width: 250,),
                const Spacer(),
                Text(data[index].name ?? "", style: TextStyle(fontSize: 25,
                    color: appProvider.isDarkThemeEnable ? AppColores
                        .accentDarkColor : AppColores.accentColor),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (index > 0) {
                            index--;
                            player.stop();
                            player.play(UrlSource(data[index].url ?? ""));
                            setState(() {

                            });
                          }
                        },
                        icon: Icon(Icons.skip_previous, size: 70,
                          color: appProvider.isDarkThemeEnable ? AppColores
                              .accentDarkColor : AppColores.accentColor,)),
                    const SizedBox(width: 30,),
                    IconButton(
                        onPressed: () {
                          player.stop();
                          player.play(UrlSource(data[index].url ?? ""));
                          isPlaying = !isPlaying;
                          setState(() {

                          });
                        },
                        icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons
                            .play_circle_fill, size: 70,
                          color: appProvider.isDarkThemeEnable ? AppColores
                              .accentDarkColor : AppColores.accentColor,)),
                    const SizedBox(width: 30,),
                    IconButton(
                        onPressed: () {
                          if (index < data.length) {
                            index++;
                            player.stop();
                            player.play(UrlSource(data[index].url ?? ""));
                            setState(() {

                            });
                          }
                        },
                        icon: Icon(Icons.skip_next, size: 70,
                          color: appProvider.isDarkThemeEnable ? AppColores
                              .accentDarkColor : AppColores.accentColor,)),


                  ],
                ),
                const Spacer(),
              ],
            );
          } else {
            // Handle the case where snapshot has no data
            return const Text('No data available');
          }
        }));}
}