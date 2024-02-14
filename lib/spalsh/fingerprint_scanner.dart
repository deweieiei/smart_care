// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_care/center/center_app.dart';

class FingerprintScanner extends StatefulWidget {
  const FingerprintScanner({super.key});

  @override
  State<FingerprintScanner> createState() => _FingerprintScannerState();
}

class _FingerprintScannerState extends State<FingerprintScanner> {
  TextEditingController password = TextEditingController();
  late final LocalAuthentication auth;
  bool supportState = false;
  // Future<void> getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics =
  //       await auth.getAvailableBiometrics();
  //   print(availableBiometrics);
  //   if (!mounted) {
  //     return;
  //   }
  // }
  Future<void> _authenticate() async {
    try {
      bool authenticate = await auth.authenticate(
          localizedReason: " ",
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));
      print(authenticate);
      if (authenticate) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CenterApp()));
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  void s() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          supportState = isSupported;
          if (supportState) {
            _authenticate();
          }
        }));
  }

  @override
  void initState() {
    s();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          // SizedBox(
          //     width: width * 0.5,
          //     child: TextField(
          //         controller: password,
          //         textAlign: TextAlign.center,
          //         keyboardType: TextInputType.number)),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CenterApp()));
                  },
                  child: const Icon(Icons.login))),
          const Divider(height: 100),

          Center(
              child: ElevatedButton(
                  onPressed: _authenticate,
                  child: const Icon(Icons.fingerprint))),
          const SizedBox(height: 100)
        ]),
      ),
    );
  }
}
