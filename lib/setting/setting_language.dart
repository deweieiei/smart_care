import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/local/local.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/spalsh/spalsh.dart';

class SettingLanguage extends StatefulWidget {
  const SettingLanguage({super.key});

  @override
  State<SettingLanguage> createState() => _SettingLanguageState();
}

class _SettingLanguageState extends State<SettingLanguage> {
  List languageList = LanguageApp().languageList;
  int? cheak;

  void save() {
    addDataInfoTodataInit(languageList[cheak!]['key']);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Spalsh()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return Scaffold(
      appBar: AppBar(
        actions: [
          cheak != null
              ? IconButton(onPressed: save, icon: const Icon(Icons.save))
              : const SizedBox()
        ],
        title: Text("${languageApp["setting_language"]}"),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff9FEAD6),
      ),
      body: BackGroundApp(
        child: ListView.builder(
          itemCount: languageList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "${languageList[index]['key']} (${languageList[index]['keys']})"),
                  Checkbox(
                      checkColor: const Color(0xff9FEAD6),
                      value: cheak != null
                          ? cheak == index
                          : languageList[index]['key'] ==
                              context.read<DataProvider>().languageApp,
                      onChanged: (e) {
                        setState(() {
                          cheak != index ? cheak = index : cheak = 0;
                        });
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
