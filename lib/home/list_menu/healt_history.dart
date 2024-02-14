import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sembast/sembast.dart';
import 'package:smart_care/local/local.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';

class HealtHistory extends StatefulWidget {
  const HealtHistory({super.key});

  @override
  State<HealtHistory> createState() => _HealtHistoryState();
}

class _HealtHistoryState extends State<HealtHistory> {
  List<RecordSnapshot<int, Map<String, Object?>>>? datalocal;
  List<Map> data = [];
  void loaddata() async {
    datalocal = await getAllDataHealthCheck();
    if (datalocal != null) {
      for (var record in datalocal!) {
        Map<String, Object?> recordData = record.value;
        data.add(recordData);
        debugPrint(data.toString());
      }
      setState(() {});
    }
  }

  void test() {
    DateTime dateTime = DateTime.now(); // วันที่ที่คุณต้องการ
    debugPrint(dateTime.toString());
    String t = dateTime.toIso8601String();
    debugPrint(t);
    String formattedDate = DateFormat('EEE').format(DateTime.parse(t));
    debugPrint(formattedDate);
  }

  @override
  void initState() {
    loaddata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9FEAD6),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(languageApp['healthhistory'].toString(),
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Prompt')),
      ),
      body: BackGroundApp(
        child: ListView(
          children: [
            boxgraph('sys', Colors.red, 'bloodpressure', 200, 50),
            boxgraph('dia', Colors.yellow, 'diastolicbloodpressure', 175, 25),
            boxgraph('spo2', Colors.green, 'spo2', 100, 80),
            boxgraph('temp', Colors.blue, 'temp', 50, 30),
            boxgraph('width', Colors.pink, 'width', 200, 0),
            boxgraph('height', Colors.orange, 'height', 250, 0),
          ],
        ),
      ),
    );
  }

  Widget boxgraph(
    String namedatas,
    Color color,
    String texthead,
    double maxy,
    double miny,
  ) {
    List<Map> datas = data.reversed.toList();
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            // boxShadow: const [
            //   BoxShadow(
            //       color: Colors.grey,
            //       offset: Offset(0, 2),
            //       blurRadius: 2,
            //       spreadRadius: -1)
            // ],
            // color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${languageApp[texthead]}",
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt'),
              ),
              SizedBox(
                  height: 200,
                  child: BarChart(
                    swapAnimationDuration: const Duration(seconds: 3),
                    BarChartData(
                      alignment: BarChartAlignment.start,
                      gridData: const FlGridData(drawVerticalLine: false),
                      titlesData: const FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 44, showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 44, showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                                reservedSize: 44, showTitles: false)),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(reservedSize: 44, showTitles: true)),
                      ),
                      borderData: FlBorderData(show: true),
                      maxY: maxy,
                      minY: miny,
                      barGroups: [
                        for (int i = 0; i < datas.length; i++)
                          if (i <= 9)
                            BarChartGroupData(
                              x: i,
                              barRods: [
                                BarChartRodData(
                                    toY: datas[i][namedatas].toString() != ''
                                        ? double.parse(datas[i][namedatas]
                                                    .toString()) <=
                                                maxy
                                            ? double.parse(
                                                datas[i][namedatas].toString())
                                            : maxy
                                        : 0,
                                    color: color,
                                    borderRadius: BorderRadius.circular(0),
                                    backDrawRodData:
                                        BackgroundBarChartRodData()),
                              ],
                            ),
                      ],
                    ),
                  )),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
