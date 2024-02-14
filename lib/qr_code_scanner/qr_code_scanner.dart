import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;

  var data;
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    _controller!.scannedDataStream.listen((scanData) {
      setState(() {
        data = scanData.code;
        print("$data");
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle textStyle = const TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w300);
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9FEAD6),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(languageApp['nametagqrcode'].toString(),
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Prompt')),
      ),
      body: data == null
          ? Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Expanded(
                      flex: 4,
                      child: QRView(
                        cameraFacing: CameraFacing.back,
                        key: _qrKey,
                        onQRViewCreated: _onQRViewCreated,
                      )),
                ),
                Center(
                  child: Container(
                    width: 1,
                    height: height,
                    color: Colors.red,
                  ),
                ),
                Center(
                  child: Container(
                    width: width,
                    height: 1,
                    color: Colors.red,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: width,
                            height: 40,
                            color: const Color.fromARGB(100, 0, 0, 0),
                            child: Center(
                              child: Text(
                                '${languageApp['']}',
                                style: textStyle,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(data.toString()),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('---'))
                ],
              ),
            ),
    );
  }
}
