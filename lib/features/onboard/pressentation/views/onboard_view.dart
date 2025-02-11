import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/on_board_body.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});
  static const String routeName = '/onboard';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardCubit(),
      child: Scaffold(
        body: OnBoardViewBody(),
      ),
    );
  }
}
