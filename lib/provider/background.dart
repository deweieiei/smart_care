// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BackGroundApp extends StatefulWidget {
  Widget child;
  BackGroundApp({super.key, required this.child});

  @override
  State<BackGroundApp> createState() => _BackGroundAppState();
}

class _BackGroundAppState extends State<BackGroundApp> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Image.asset("assets/background/background.png", fit: BoxFit.fill),
            ],
          )),
      widget.child,
    ]);
  }
}
