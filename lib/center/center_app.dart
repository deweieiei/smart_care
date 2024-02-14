import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/home/home.dart';
import 'package:smart_care/personalrecord/personalrecord.dart';
import 'package:smart_care/profile/profile.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/qr_code_scanner/create_qr_code.dart';
import 'package:smart_care/styleapp/styleapp.dart';
import 'package:smart_care/center/drawer_app.dart';
import 'dart:io';

import 'package:smart_care/totalview/totalview.dart';

class CenterApp extends StatefulWidget {
  const CenterApp({super.key});
  void inprofile() {
    debugPrint('123456');
  }

  @override
  State<CenterApp> createState() => _CenterAppState();
}

class _CenterAppState extends State<CenterApp> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeApp();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyleA = const TextStyle(
        fontSize: 10,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w300,
        color: color0047FF);
    TextStyle textStyleB = const TextStyle(
        fontSize: 10,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w300,
        color: colorGrey);
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    double width = MediaQuery.of(context).size.width;
    var texts = context.read<DataProvider>();
    TextStyle textStyle = const TextStyle(
        fontSize: 16,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w400,
        color: colorblack);
    return Scaffold(
      appBar: currentTab != 3
          ? AppBar(
              title: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: colorE7F0FF,
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipOval(
                      child: context.read<DataProvider>().imageFile != null
                          ? Image.file(
                              File(context.read<DataProvider>().imageFile!),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, Welcome', style: textStyleB),
                        texts.userName != null
                            ? Text('${texts.userName} ${texts.surname}',
                                style: textStyle)
                            : const Text(''),
                      ],
                    ),
                  )
                ],
              ),
              actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                ])
          : null,
      drawer: const DrawerApp(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 2),
                ],
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xffffffff)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NameTagQRCode()));
              },
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: colorwhite,

        //  shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = const HomeApp();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home,
                              color: currentTab == 0 ? color00A3FF : colorGrey),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${languageApp['home']}",
                              style: currentTab == 0 ? textStyleA : textStyleB),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = ToTalView();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.note_alt,
                              color: currentTab == 1 ? color00A3FF : colorGrey),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${languageApp['healthcheck']}",
                              style: currentTab == 1 ? textStyleA : textStyleB),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = const PersonalRecord();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.content_paste,
                              color: currentTab == 2 ? color00A3FF : colorGrey),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${languageApp['personalrecord']}",
                              style: currentTab == 2 ? textStyleA : textStyleB),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = const ProfileApp();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,
                              color: currentTab == 3 ? color00A3FF : colorGrey),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${languageApp['profile']}",
                              style: currentTab == 3 ? textStyleA : textStyleB),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //  DefaultTabController(
    //     animationDuration: const Duration(milliseconds: 400),
    //     length: 4,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         foregroundColor: Colors.white,
    //         backgroundColor: const Color(0xff9FEAD6),
    //         title: Text(
    //           "${languageApp['smartcare']}",
    //           style: const TextStyle(
    //               fontFamily: 'Prompt',
    //               fontWeight: FontWeight.w500,
    //               color: Color(0xffffffff)),
    //         ),
    //       ),
    //       drawer: const DrawerApp(),
    //       body: Stack(
    //         children: [
    //           Container(
    //             decoration: const BoxDecoration(
    //                 gradient: LinearGradient(
    //                     begin: Alignment.topCenter,
    //                     end: Alignment.bottomCenter,
    //                     colors: [
    //                   Color.fromARGB(255, 245, 245, 245),
    //                   Color(0xffffffff)
    //                 ])),
    //           ),
    //           TabBarView(
    //             children: body,
    //           ),
    //         ],
    //       ),
    //       floatingActionButton: Container(
    //         width: 80,
    //         height: 80,
    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
    //         child: Center(
    //           child: Container(
    //             width: 70,
    //             height: 70,
    //             decoration: BoxDecoration(
    //                 boxShadow: const [
    //                   BoxShadow(
    //                       color: Colors.grey,
    //                       offset: Offset(0, 2),
    //                       blurRadius: 2),
    //                 ],
    //                 borderRadius: BorderRadius.circular(35),
    //                 color: const Color(0xffffffff)),
    //             child: IconButton(
    //               onPressed: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const NameTagQRCode()));
    //               },
    //               icon: const Icon(
    //                 Icons.qr_code_scanner,
    //                 color: Colors.grey,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       floatingActionButtonLocation:
    //           FloatingActionButtonLocation.centerDocked,
    //       bottomNavigationBar: SizedBox(
    //         // color: Colors.white,
    //         child: TabBar(
    //             unselectedLabelColor: Colors.grey,
    //             labelColor: const Color.fromARGB(255, 93, 202, 173),
    //             indicatorColor: const Color.fromARGB(255, 93, 202, 173),
    //             tabs: [
    //               Tab(
    //                   icon: const Icon(Icons.home),
    //                   child: Text(
    //                       overflow: TextOverflow.ellipsis,
    //                       maxLines: 1,
    //                       "${languageApp['home']}",
    //                       style: textStyle)),
    //               Tab(
    //                   icon: const Icon(Icons.note_alt),
    //                   child: Text(
    //                       overflow: TextOverflow.ellipsis,
    //                       maxLines: 1,
    //                       "${languageApp['healthcheck']}",
    //                       style: textStyle)),
    //               Tab(
    //                   icon: const Icon(Icons.content_paste),
    //                   child: Text(
    //                       overflow: TextOverflow.ellipsis,
    //                       maxLines: 1,
    //                       "${languageApp['personalrecord']}",
    //                       style: textStyle)),
    //               Tab(
    //                   icon: const Icon(Icons.person),
    //                   child: Text(
    //                       overflow: TextOverflow.ellipsis,
    //                       maxLines: 1,
    //                       "${languageApp['profile']}",
    //                       style: textStyle)),
    //             ]),
    //       ),
    //     ));
  }
}
