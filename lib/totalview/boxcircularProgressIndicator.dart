// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smart_care/styleapp/styleapp.dart';

class BoxcirCularProgressIndicator extends StatefulWidget {
  BoxcirCularProgressIndicator(
      {super.key,
      this.value = 0,
      this.maxValue = 100,
      this.color = Colors.green,
      this.text = '--',
      this.nameValue = '-',
      this.unitofMeasurement = '-'});
  double value;
  double maxValue;
  Color color;
  String text;
  String nameValue;
  String unitofMeasurement;

  @override
  State<BoxcirCularProgressIndicator> createState() =>
      _BoxcirCularProgressIndicatorState();
}

class _BoxcirCularProgressIndicatorState
    extends State<BoxcirCularProgressIndicator> {
  double calculatePercentage(double maxValue, double value) {
    double percentage = (value / maxValue) * 100;
    return percentage / 100;
  }

  TextStyle textStyle = const TextStyle(
      fontSize: 12,
      fontFamily: 'Prompt',
      fontWeight: FontWeight.w400,
      color: colorblack);
  TextStyle textStyleB = const TextStyle(
      fontSize: 16,
      fontFamily: 'Prompt',
      fontWeight: FontWeight.w500,
      color: colorblack);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(widget.text,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w300,
                            color: widget.color)),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                    value: calculatePercentage(widget.maxValue, widget.value),
                    color: widget.color,
                    strokeWidth: 15,
                    semanticsLabel: 'semanticsLabel',
                    semanticsValue: 'semanticsValue',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(widget.nameValue, style: textStyle),
            Text(widget.value.toString(), style: textStyleB),
            Text(widget.unitofMeasurement, style: textStyle),
          ],
        ),
      ),
    ));
  }
}
