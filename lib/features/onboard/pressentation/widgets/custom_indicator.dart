import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final OnBoardCubit cubit = context.read<OnBoardCubit>();
    return BlocBuilder<OnBoardCubit, OnBoardState>(
      buildWhen: (previous, current) => current is Success<int>,
      builder: (context, state) {
        if (state is! Success<int> && state is! Initial) {
          return const SizedBox();
        }
        return Container(
          width: 16.h,
          height: 16.h,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: currentIndex == (cubit.onBoardController.page ?? 0)
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            borderRadius: currentIndex == (cubit.onBoardController.page ?? 0)
                ? BorderRadius.circular(50)
                : BorderRadius.circular(25),
          ),
        );
      },
    );
  }
}
