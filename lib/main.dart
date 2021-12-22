import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:study_package/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initNotiSetting();

  runApp(const MyApp());
}

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void _initNotiSetting() async {
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  final result = await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  print(result);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
