<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/custom_onboard_item.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/navigation_row.dart';

class OnBoardViewBody extends StatelessWidget {
  const OnBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardCubit cubit = context.read<OnBoardCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: PageView(
            controller: cubit.onBoardController,
            physics: const BouncingScrollPhysics(),
            children: [
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_1,
                text: AppLocalizations.of(context)!.onBoard_1,
              ),
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_2,
                text: AppLocalizations.of(context)!.onBoard_2,
              ),
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_3,
                text: AppLocalizations.of(context)!.onBoard_3,
              ),
            ],
            onPageChanged: (int index) {
              cubit.onPageChanged(index);
            },
          ),
        ),
        const NavigationRow(),
      ],
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager_paraffin/core/managers/assets_manager.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/custom_onboard_item.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/navigation_row.dart';
import 'package:tager_paraffin/generated/app_localizations.dart';

class OnBoardViewBody extends StatelessWidget {
  const OnBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardCubit cubit = context.read<OnBoardCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: PageView(
            controller: cubit.onBoardController,
            physics: const BouncingScrollPhysics(),
            children: [
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_1,
                text: AppLocalizations.of(context)!.onBoard_1,
              ),
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_2,
                text: AppLocalizations.of(context)!.onBoard_2,
              ),
              CustomOnBoardItem(
                imagePath: AssetsManager.onBoard_3,
                text: AppLocalizations.of(context)!.onBoard_3,
              ),
            ],
            onPageChanged: (int index) {
              cubit.onPageChanged(index);
            },
          ),
        ),
        const NavigationRow(),
      ],
    );
  }
}
>>>>>>> e1be5033add3d48e73b1409a31d21df9a80ea207
