import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/my_app.dart';
import 'package:tager_paraffin/simple_observer.dart';

void main() {
  runApp(MyApp());
  Bloc.observer = SimpleBlocObServer();
}
