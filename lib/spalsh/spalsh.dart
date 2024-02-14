// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast/sembast.dart';
import 'package:smart_care/local/local.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/spalsh/fingerprint_scanner.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  Future loadData() async {
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
        debugPrint('${context.read<DataProvider>().level}');
      }
    } else {
      context.read<DataProvider>().level = 0;
      debugPrint('No information');
    }

    loadDataInit();
  }

  Future loadDataInit() async {
    List<RecordSnapshot<int, Map<String, Object?>>>? data =
        await getAllDataInit();
    if (data.isNotEmpty) {
      for (final record in data) {
        final map = record.value;

        context.read<DataProvider>().languageApp = map['language'].toString();
        debugPrint(context.read<DataProvider>().languageApp);

        debugPrint('$map succeed');
      }
    } else {
      context.read<DataProvider>().languageApp = 'EN';
      debugPrint('No language');
    }
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const FingerprintScanner()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xff9FEAD6),
          color: Colors.white,
        ),
      ),
    );
  }
}
