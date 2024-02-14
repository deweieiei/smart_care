// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/local/local.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/styleapp/styleapp.dart';

// ignore: must_be_immutable
class BoxValueHealth extends StatefulWidget {
  String? unit;
  String? section;
  TextEditingController? controllers;
  String? icon;
  BoxValueHealth({
    super.key,
    this.unit,
    this.section,
    this.controllers,
    this.icon,
  });

  @override
  State<BoxValueHealth> createState() => _BoxValueHealthState();
}

class _BoxValueHealthState extends State<BoxValueHealth> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            widget.section != null
                ? Text("${widget.section}",
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Prompt'))
                : const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 80,
                    height: 80,
                    child:
                        Image.asset('assets/home/healthcheck/${widget.icon}')),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: TextField(
                            controller: widget.controllers,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              hintText: '-',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Prompt',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 41, 179, 142)),
                          ),
                        ),
                      ),
                    ),
                    widget.unit != null
                        ? Text(
                            "${widget.unit}",
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Prompt'),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HealthChecker extends StatefulWidget {
  const HealthChecker({super.key});

  @override
  State<HealthChecker> createState() => _HealthCheckerState();
}

class _HealthCheckerState extends State<HealthChecker> {
  TextEditingController sys = TextEditingController();
  TextEditingController dia = TextEditingController();
  TextEditingController spo2 = TextEditingController();
  TextEditingController temp = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  DateTime dateTime = DateTime.now();
  bool load = false;
  void saveDataHealthCheck() async {
    setState(() {
      load = true;
    });
    bool add = await addDataInfoTodataHealthCheck(
      sys.text, dia.text, spo2.text,
      temp.text, width.text, height.text, '2023-09-01T09:46:56.525905',
      //  dateTime.toIso8601String(),
    );
    if (add) {
      Timer(const Duration(seconds: 1), () {
        setState(() {
          load = false;
        });
        Navigator.pop(context);
      });
    } else {
      setState(() {
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: load == false
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorwhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      saveDataHealthCheck();
                    },
                    child: const Icon(
                      Icons.archive,
                      color: color0047FF,
                    ))
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          )
        ],
        backgroundColor: color0047FF,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(languageApp['healthcheck'].toString(),
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Prompt')),
      ),
      body: BackGroundApp(
        child: ListView(
          children: [
            BoxValueHealth(
              section: 'ค่าหัวใจบีบตัว',
              unit: ' / mmHg',
              controllers: sys,
              icon: 'sphygmomanometer.gif',
            ),
            BoxValueHealth(
              section: 'ค่าหัวใจคลายตัว',
              unit: ' / mmHg',
              controllers: dia,
              icon: 'blood-donation (1).gif',
            ),
            BoxValueHealth(
              section: 'Spo2',
              unit: ' / min',
              controllers: spo2,
              icon: 'oximeter.gif',
            ),
            BoxValueHealth(
              section: 'อุณหภูมิ',
              unit: ' / c',
              controllers: temp,
              icon: 'thermometer.gif',
            ),
            BoxValueHealth(
              section: 'น้ำหนัก',
              unit: ' / kg',
              controllers: width,
              icon: 'weight-scale.gif',
            ),
            BoxValueHealth(
              section: 'ส่วนสูง',
              unit: ' / cm',
              controllers: height,
              icon: 'height.gif',
            ),
          ],
        ),
      ),
    );
  }
}
