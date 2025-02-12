import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tager_paraffin/core/widgets/custom_label_widget.dart';
import 'package:tager_paraffin/features/onboard/pressentation/manager/on_board_cubit.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardCubit cubit = context.read<OnBoardCubit>();
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        if (cubit.onBoardController.page == 0) return;
        cubit.onBoardController.previousPage(
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOutBack,
        );
      },
      child: CustomLabel(
        text: AppLocalizations.of(context)!.previous,
      ),
    );
  }
}
