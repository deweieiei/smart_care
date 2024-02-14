import 'package:flutter/material.dart';
import 'package:smart_care/home/test.dart';
import 'package:smart_care/styleapp/styleapp.dart';
import 'package:smart_care/totalview/boxcircularProgressIndicator.dart';

class ToTalView extends StatefulWidget {
  const ToTalView({super.key});

  @override
  State<ToTalView> createState() => _ToTalViewState();
}

class _ToTalViewState extends State<ToTalView> {
  String date = '8:30 น. 14/03/2566';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        fontSize: 10,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w500,
        color: colorGrey);
    TextStyle textStyleA = const TextStyle(
        fontSize: 16,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w400,
        color: color0047FF);
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  color: Colors.grey)
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Text(date, style: textStyle)],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxcirCularProgressIndicator(
                      text: 'ดี',
                      nameValue: 'SYS',
                      value: 120,
                      maxValue: 200,
                      unitofMeasurement: 'mmHg',
                      color: Colors.green,
                    ),
                    BoxcirCularProgressIndicator(
                      text: 'สูง',
                      nameValue: 'DIA',
                      value: 86,
                      maxValue: 200,
                      unitofMeasurement: 'mmHg',
                      color: Colors.orange,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestApp()));
                      },
                      child: SizedBox(
                        width: 300,
                        child: Center(
                            child:
                                Text('ดูข้อมูลเพิ่มเติม', style: textStyleA)),
                      )),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(''),
              ),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(''),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(''),
              ),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: -1,
                        color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(''),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
