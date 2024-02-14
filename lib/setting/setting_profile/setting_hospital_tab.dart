import 'package:flutter/material.dart';
import 'package:smart_care/provider/background.dart';

class SettinghospitalTab extends StatefulWidget {
  const SettinghospitalTab({super.key});

  @override
  State<SettinghospitalTab> createState() => _SettinghospitalTabState();
}

class _SettinghospitalTabState extends State<SettinghospitalTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BackGroundApp(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: height * 0.9,
                            child: Column(children: <Widget>[
                              ListTile(
                                title: const Text('---'),
                                onTap: () {
                                  // ทำอะไรกับ Option 2
                                  Navigator.of(context)
                                      .pop(); // ปิด Bottom Sheet
                                },
                              ),
                              const TextField()
                            ]));
                      });
                },
                icon: const Icon(Icons.add)),
          ),
          SizedBox(
            height: height * 0.7,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
