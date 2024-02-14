import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:flip_card/flip_card.dart';
import 'package:smart_care/provider/provider.dart';

class ProfileApp extends StatefulWidget {
  const ProfileApp({super.key});

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    //   double width = MediaQuery.of(context).size.width;
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    int level = context.read<DataProvider>().level!;
    return BackGroundApp(
      child: ListView(
        children: [
          const SizedBox(height: 50),
          level > 0
              ? FlipCard(
                  fill: Fill.fillBack,
                  direction: FlipDirection.HORIZONTAL,
                  side: CardSide.FRONT,
                  front: SizedBox(
                    child: Center(
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey)),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 5,
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
                              ),
                              child: ClipOval(
                                child: context.read<DataProvider>().imageFile !=
                                        null
                                    ? Image.file(
                                        File(context
                                            .read<DataProvider>()
                                            .imageFile!),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${languageApp['name']} ${context.read<DataProvider>().userName} ${context.read<DataProvider>().surname}",
                              style: const TextStyle(fontFamily: 'Prompt'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${languageApp['iduser']} #Q877G334",
                              style: const TextStyle(fontFamily: 'Prompt'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(height: 1, color: Colors.grey),
                          ),
                          Text(
                            "${languageApp['healthlevel']} Good",
                            style: const TextStyle(fontFamily: 'Prompt'),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(height: 1, color: Colors.grey),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  back: SizedBox(
                    child: Center(
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ),
                  ))
              : SizedBox(
                  child: Center(
                    child: Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey)),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
