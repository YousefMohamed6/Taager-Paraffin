<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/services/firebase_messaging_service.dart';
import 'package:tager_paraffin/core/services/secure_storage_service.dart';
import 'package:tager_paraffin/core/uitls/firebase_options.dart';
import 'package:tager_paraffin/core/uitls/simple_observer.dart';
import 'package:tager_paraffin/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  await ScreenUtil.ensureScreenSize();
  await NotificationsService.instance.initialize();
  Bloc.observer = SimpleBlocObServer();
  SecureStorageManager().init();
  runApp(MyApp());
}
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/services/secure_storage_service.dart';
import 'package:tager_paraffin/core/services/firebase_notification.dart';
import 'package:tager_paraffin/core/uitls/firebase_options.dart';
import 'package:tager_paraffin/core/uitls/simple_observer.dart';
import 'package:tager_paraffin/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  await ScreenUtil.ensureScreenSize();
  await FirebaseNotificationService.instance.initialize();
  Bloc.observer = SimpleBlocObServer();
  SecureStorageManager().init();
  runApp(MyApp());
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
