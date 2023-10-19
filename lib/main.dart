import 'package:fire_chat/scr/controller/notification.dart';
import 'package:fire_chat/scr/widget/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService()
    ..requestPermisson()
    ..generateToken()
    ..notificationSettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}