import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_care/provider/language.dart';
import 'package:smart_care/provider/provider.dart';
import 'package:smart_care/setting/setting_device.dart';
import 'package:smart_care/setting/setting_language.dart';
import 'package:smart_care/setting/setting_notifications.dart';
import 'package:smart_care/setting/setting_profile.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> languageApp =
        LanguageApp().languageApp(context.read<DataProvider>().languageApp!);
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 100),
          line(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('${languageApp["setting_profile"]}'),
            onTap: () {
              naviga(const SettingProfile());
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('${languageApp["setting_language"]}'),
            onTap: () {
              naviga(const SettingLanguage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('${languageApp["setting_notifications"]}'),
            onTap: () {
              naviga(const SettingNotifications());
            },
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: Text('${languageApp["setting_device"]}'),
            onTap: () {
              naviga(const SettingDevice());
            },
          ),
          line(),
          ListTile(
            leading: const Icon(Icons.emergency),
            title: Text('${languageApp["setting_helpcenter"]}'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: Text('${languageApp["setting_report"]}'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: Text('${languageApp["setting_termsandpolicies"]}'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('${languageApp["setting_logout"]}'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget line() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 1, width: double.infinity, color: Colors.grey),
    );
  }

  void naviga(Widget widget) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
