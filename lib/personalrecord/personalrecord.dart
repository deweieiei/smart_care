// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_care/provider/background.dart';

class PersonalRecord extends StatefulWidget {
  const PersonalRecord({super.key});

  @override
  State<PersonalRecord> createState() => _PersonalRecordState();
}

class _PersonalRecordState extends State<PersonalRecord> {
  bool _edit = false;
  bool _loadsave = false;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  void savedata() {
    setState(() {
      _loadsave = !_loadsave;
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _loadsave = !_loadsave;
        _edit = !_edit;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double widget = MediaQuery.of(context).size.width;
    return BackGroundApp(
        child: _edit != true
            ? ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: widget,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('ประวัติ',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Prompt')),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _edit = !_edit;
                                  });
                                },
                                icon: const Icon(Icons.edit))
                          ]),
                    ),
                  ),
                  Box('ประวัติการเเพ้ยา', 'ไม่มีประวัติเเพ้ยา'),
                  Box('โรคประจำตัว', 'ไม่มีโรคประจำตัว'),
                  Box('ยาทาน/ใช้ ประจำ', 'ไม่มี ยาทาน/ใช้ ประจำ'),
                ],
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: widget,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('เเก้ใขประวัติ',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Prompt')),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  savedata();
                                });
                              },
                              icon: !_loadsave
                                  ? const Icon(Icons.save)
                                  : const CircularProgressIndicator(
                                      backgroundColor: Color(0xff9FEAD6),
                                      color: Colors.white,
                                    ),
                            )
                          ]),
                    ),
                  ),
                ],
              ));
  }

  Widget Box(String text, String textdata) {
    TextStyle style = TextStyle(
        color: Colors.grey.shade600,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Prompt');
    double widget = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: style),
          Container(
              width: widget,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textdata, style: style),
              )),
        ],
      ),
    );
  }
}
