// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/HealthChecker/healthchecker.dart';
import 'package:smart_care/home/list_menu/healt_history.dart';
import 'package:smart_care/home/test.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/styleapp/styleapp.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List items = [
    'p_1.png',
    'p_2.png',
    'p_3.png',
    'p_4.png',
  ];
  List<Widget> itemMenu = [
    ItemBox(
        navigator: const HealthChecker(),
        icon: 'assets/home/service/Frame 92552.png',
        text: 'healthhistory'),
    ItemBox(
        navigator: const HealtHistory(),
        icon: 'assets/home/service/Frame 925521.png',
        text: 'disease/medicine'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925522.png',
        text: 'activity'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925523.png',
        text: 'rest'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925524.png',
        text: 'disease/medicine'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925525.png',
        text: 'activity'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925526.png',
        text: 'rest'),
    ItemBox(
        navigator: const TestApp(),
        icon: 'assets/home/service/Frame 925527.png',
        text: 'other'),
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        fontSize: 12,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w300,
        color: colorGrey);

    TextStyle textStyleC = const TextStyle(
        fontSize: 16,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w500,
        color: colorblack);

    return Scaffold(
      // drawer: DrawerApp(),

      body: Container(
        decoration: BoxDecoration(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome to Nursing Home Hospital', style: textStyleC),
                  Text("Ensuring the Elderly's Health", style: textStyle),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Image.asset('assets/home/Frame.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text('Service List', style: textStyleC),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: itemMenu,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text("Interesting Things", style: textStyleC),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Center(
                child: Container(
                  height: 170,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CarouselSlider.builder(
                    itemCount: items.length,
                    options: CarouselOptions(
                        enlargeCenterPage: false,
                        autoPlay: true,
                        pageSnapping: false,
                        padEnds: true,
                        height: 170,
                        autoPlayInterval: const Duration(seconds: 10)),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Center(
                            child: Container(
                              height: 170,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/home/${items[index]}'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBox extends StatefulWidget {
  String text;
  String icon;
  Widget? navigator;
  ItemBox({super.key, required this.text, required this.icon, this.navigator});

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  void nextnavigator() async {
    if (widget.navigator != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.navigator!));
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return GestureDetector(
      onTap: nextnavigator,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                height: 50,
                width: 50,
                child: Image.asset(widget.icon),
              ),
            )),
            Text(
              languageApp[widget.text].toString(),
              style: const TextStyle(fontFamily: 'Prompt', fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

// class HomeApp extends StatefulWidget {
//   const HomeApp({super.key});

//   @override
//   State<HomeApp> createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<Widget> itemMenu = [
//     ItemBox(
//         navigator: const HealtHistory(),
//         icon: 'assets/home/health-checkup(2).gif',
//         text: 'healthhistory'),
//     ItemBox(icon: 'assets/home/drugs.gif', text: 'disease/medicine'),
//     ItemBox(icon: 'assets/home/mobile-app.gif', text: 'activity'),
//     ItemBox(icon: 'assets/home/pyramid.gif', text: 'rest'),
//     ItemBox(icon: 'assets/home/more.png', text: 'other'),
//   ];

//   List<Widget> itemConsultDoctor = [
//     ItemBox(icon: 'assets/home/upcoming.gif', text: 'appointment'),
//     ItemBox(icon: 'assets/home/medical-team.png', text: 'doctornearme'),
//     ItemBox(icon: 'assets/home/sos.gif', text: 'emergency'),
//   ];
//   List<Widget> itemProduct = [
//     ItemBox(icon: 'assets/home/free-gift.gif', text: 'promotion'),
//     ItemBox(icon: 'assets/home/detox.gif', text: 'foodsupplement'),
//     ItemBox(icon: 'assets/home/drugs.gif', text: 'medicine'),
//     ItemBox(icon: 'assets/home/thermometer.png', text: 'healthmonitor'),
//     ItemBox(
//       icon: 'assets/icon/Vector.png',
//       text: 'scan',
//       navigator: const QrCodeScanner(),
//     ),
//   ];

//   List items = [
//     'p_1.png',
//     'p_2.png',
//     'p_3.png',
//     'p_4.png',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     Map<String, String> languageApp =
//         LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
//     return BackGroundApp(
//       child: ListView(children: [
//         SizedBox(
//           width: width,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: 200,
//                     width: width,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 1,
//                             offset: Offset(0, 0.5))
//                       ],
//                       color: Color.fromRGBO(255, 255, 255, 1),
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(15),
//                           bottomRight: Radius.circular(15)),
//                       // border: Border.all(color: Colors.grey),
//                     ),
//                     child: Text(
//                       languageApp['wellcome'].toString(),
//                       style: const TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 22,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Prompt'),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 250,
//                     width: width,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(50),
//                               border: Border.all(
//                                   width: 5,
//                                   color:
//                                       const Color.fromARGB(255, 221, 221, 221)),
//                             ),
//                             child:
//                                 context.read<DataProvider>().imageFile != null
//                                     ? ClipOval(
//                                         child: Image.file(
//                                             File(context
//                                                 .read<DataProvider>()
//                                                 .imageFile!),
//                                             fit: BoxFit.cover,
//                                             width: 100,
//                                             height: 100))
//                                     : null,
//                           )
//                         ]),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         box([
//           section('menu'),
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: 10,
//             runSpacing: 10,
//             children: itemMenu,
//           ),
//         ]),
//         box([
//           section('news'),
//           CarouselSlider.builder(
//             itemCount: items.length,
//             options: CarouselOptions(
//                 enlargeCenterPage: false,
//                 autoPlay: true,
//                 height: 170,
//                 autoPlayInterval: const Duration(seconds: 10)),
//             itemBuilder: (BuildContext context, int index, int realIndex) {
//               return SizedBox(
//                 child: Center(
//                   child: Container(
//                     height: 170,
//                     width: 400,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey),
//                         image: DecorationImage(
//                             image: AssetImage('assets/home/${items[index]}'),
//                             fit: BoxFit.cover)),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ]),
//         box([
//           section("consult_a_doctor"),
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: 10,
//             runSpacing: 10,
//             children: itemConsultDoctor,
//           ),
//         ]),
//         box([
//           section('health_products'),
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: 10,
//             runSpacing: 10,
//             children: itemProduct,
//           ),
//         ]),
//       ]),
//     );
//   }

//   Widget section(String text) {
//     Map<String, String> languageApp =
//         LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(languageApp[text].toString(),
//               style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                   fontFamily: 'Prompt')),
//         ),
//       ],
//     );
//   }

//   Widget box(List<Widget> widget) {
//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 2, bottom: 2),
//           child: Column(
//             children: widget,
//           ),
//         ),
//       ),
//     );
//   }
// }
