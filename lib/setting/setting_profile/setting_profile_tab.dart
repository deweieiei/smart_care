// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sembast/sembast.dart';
import 'package:smart_care/local/local.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';

//SettinghospitalTab
class SettingProfileTab extends StatefulWidget {
  const SettingProfileTab({super.key});

  @override
  State<SettingProfileTab> createState() => _SettingProfileTabState();
}

class _SettingProfileTabState extends State<SettingProfileTab> {
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();

  DateTime birthday = DateTime.utc(1923, 12, 31);
  File? imageFile;
  bool loadsave = false;

  void loadData() {
    if (context.read<DataProvider>().userName != null) {
      name.text = context.read<DataProvider>().userName!;
      lastname.text = context.read<DataProvider>().surname!;
      setState(() {});
    }
  }

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  void save() async {
    if (name.text != null &&
        lastname.text != null &&
        name.text != '' &&
        lastname.text != '') {
      setState(() {
        loadsave = true;
      });
      bool succeed = await addDataInfoToDatabase(
        name.text,
        lastname.text,
        birthday,
        imageFile?.path,
        1,
      );
      if (succeed) {
        load();
      }
    }
  }

  Future load() async {
    List<RecordSnapshot<int, Map<String, Object?>>>? data = await getAllData();
    if (data.isNotEmpty) {
      for (final record in data) {
        final map = record.value;
        context.read<DataProvider>().userName = map['name'] as String;
        context.read<DataProvider>().surname = map['surname'] as String;
        context.read<DataProvider>().birthdate =
            DateTime.parse(map['birthdate'] as String).toString();
        if (map['imageFile'] != null) {
          context.read<DataProvider>().imageFile = map['imageFile'].toString();
        }
        context.read<DataProvider>().level = map['level'] as int;
        debugPrint('$map succeed');
      }
    } else {
      context.read<DataProvider>().level = 0;
      debugPrint('No information');
    }

    Timer(const Duration(seconds: 1), () {
      setState(() {
        loadsave = false;
      });
      Navigator.pop(context);
    });
  }

  Future openGallery() async {
    final imagePart =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePart == null) return;
    setState(() {
      imageFile = File(imagePart.path);
    });
  }

  Future opencamera() async {
    final imagePart = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePart == null) return;
    setState(() {
      imageFile = File(imagePart.path);
    });
  }

  Widget dataImage() {
    return box(ClipOval(
        child: Image.file(File(context.read<DataProvider>().imageFile!),
            fit: BoxFit.cover, width: 100, height: 100)));
  }

  Widget partImage() {
    return box(ClipOval(
        child: Image.file(imageFile!, // ส่งภาพที่ถ่ายมาเป็นไฟล์
            fit: BoxFit.cover,
            width: 100,
            height: 100)));
  }

  Widget box(Widget widget) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              width: 5, color: const Color.fromARGB(255, 221, 221, 221)),
          image: const DecorationImage(
            image: AssetImage('assets/profile/add.gif'),
            fit: BoxFit.cover,
          )),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return BackGroundApp(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
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
                    child: GestureDetector(
                      onTap: opencamera,
                      child: context.read<DataProvider>().imageFile != null
                          ? imageFile != null
                              ? partImage()
                              : dataImage()
                          : imageFile != null
                              ? partImage()
                              : box(const SizedBox()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontFamily: 'Prompt'),
                              decoration: InputDecoration(
                                hintText: languageApp['entername'],
                              ),
                            )),
                        SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: lastname,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontFamily: 'Prompt'),
                              decoration: InputDecoration(
                                hintText: languageApp['enterlastname'],
                              ),
                            ))
                      ],
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
                    "${languageApp['healthlevel']}       ",
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
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Center(
              child: Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey)),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: save,
            icon: loadsave == false
                ? const Icon(Icons.save)
                : const CircularProgressIndicator(
                    color: Colors.black,
                  )),
      ]),
    );
  }
}
