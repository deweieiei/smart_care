// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';

class SettingNotifications extends StatefulWidget {
  const SettingNotifications({super.key});

  @override
  State<SettingNotifications> createState() => _SettingNotificationsState();
}

class _SettingNotificationsState extends State<SettingNotifications> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff9FEAD6),
        title: Text(
          "${languageApp['setting_notifications']}",
          style: const TextStyle(
              fontFamily: 'Prompt',
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff)),
        ),
      ),
      body: BackGroundApp(
          child: ListView(children: [
        BoxNotifications(text: '1', isSwitched: true),
        BoxNotifications(text: '2', isSwitched: true),
        BoxNotifications(text: '3', isSwitched: true)
      ])),
    );
  }
}

class BoxNotifications extends StatefulWidget {
  String? text;
  bool isSwitched;
  BoxNotifications({super.key, this.text, required this.isSwitched});

  @override
  State<BoxNotifications> createState() => _BoxNotificationsState();
}

class _BoxNotificationsState extends State<BoxNotifications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(offset: Offset(0, 1), blurRadius: 2, spreadRadius: -2)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.text != null
                  ? Text(
                      widget.text!,
                      style: const TextStyle(
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const SizedBox(),
              Switch(
                value: widget.isSwitched,
                onChanged: (value) {
                  setState(() {
                    widget.isSwitched = value;
                  });
                },
              ),
            ],
          )),
    );
  }
}
