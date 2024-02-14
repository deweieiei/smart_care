// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/setting/setting_profile/setting_hospital_tab.dart';
import 'package:smart_care/setting/setting_profile/setting_profile_tab.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  List<Widget> body = [
    const SettingProfileTab(),
    const SettinghospitalTab(),
  ];
  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    TextStyle textStyle =
        const TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w300);
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 400),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${languageApp["setting_profile"]}"),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff9FEAD6),
        ),
        body: Scaffold(
          appBar: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: const Color.fromARGB(255, 93, 202, 173),
              indicatorColor: const Color.fromARGB(255, 93, 202, 173),
              tabs: [
                Tab(
                    icon: const Icon(Icons.person),
                    child: Text(" ", style: textStyle)),
                Tab(
                    icon: const Icon(Icons.calendar_month),
                    child: Text(" ", style: textStyle)),
              ]),
          body: TabBarView(
            children: body,
          ),
        ),
      ),
    );
  }
}
