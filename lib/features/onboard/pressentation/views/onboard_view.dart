import 'package:flutter/material.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/on_board_body.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});
  static const String routeName = '/onboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardViewBody(),
    );
  }
}
