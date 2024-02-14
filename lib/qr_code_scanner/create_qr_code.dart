import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_care/provider/background.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';

class NameTagQRCode extends StatefulWidget {
  const NameTagQRCode({super.key});

  @override
  State<NameTagQRCode> createState() => _NameTagQRCodeState();
}

class _NameTagQRCodeState extends State<NameTagQRCode> {
//   // ฟังก์ชันเข้ารหัสข้อมูล
//   String encryptData(String input) {
//     final key = Key.fromUtf8('adb1235'); // ใช้คีย์ 'adb1235' เพื่อเข้ารหัส
//     final bytes = utf8.encode(input);
//     final encrypter = Encrypter(AES(key)); // ใช้ AES encryption ด้วยคีย์

//     final encrypted = encrypter.encrypt(input);

//     return encrypted.base64; // คืนค่าข้อมูลที่ถูกเข้ารหัสเป็น Base64
//   }

// // ฟังก์ชันถอดรหัสข้อมูล
//   String decryptData(String input) {
//     final key = Key.fromUtf8('adb1235'); // ใช้คีย์ 'adb1235' เพื่อถอดรหัส
//     final encrypter = Encrypter(AES(key)); // ใช้ AES encryption ด้วยคีย์

//     final decrypted = encrypter.decrypt(Encrypted.fromBase64(input));

//     return decrypted; // คืนค่าข้อมูลที่ถูกถอดรหัส
//   }

  @override
  Widget build(BuildContext context) {
    var tag = context.read<DataProvider>();
    Map datauser = {
      "name": "${tag.userName} ${tag.surname}",
      "id": "1710501456572",
    };
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);

    double width = MediaQuery.of(context).size.width;
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
      body: BackGroundApp(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                      color: Colors.white,
                      height: width * 0.5,
                      width: width * 0.5),
                  QrImageView(
                    data: datauser.toString(),
                    version: QrVersions.auto,
                    size: width * 0.5,
                  ),
                  SizedBox(
                    height: width * 0.5,
                    width: width * 0.5,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: ClipOval(
                            child: Image.asset(
                          'assets/icon/health-care.png',
                          fit: BoxFit.cover,
                          width: width * 0.08,
                          height: width * 0.08,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
