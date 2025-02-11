import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/core/managers/secure_storage_service.dart';
import 'package:tager_paraffin/core/uitls/firebase_options.dart';
import 'package:tager_paraffin/core/uitls/simple_observer.dart';
import 'package:tager_paraffin/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  SecureStorageManager().init();
  Bloc.observer = SimpleBlocObServer();
  runApp(MyApp());
}
