import 'package:flutter/material.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/custom_indicator.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/next_button.dart';
import 'package:tager_paraffin/features/onboard/pressentation/widgets/previous_button.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PreviousButton(),
        Row(
          children: [
            CustomIndicator(currentIndex: 0),
            CustomIndicator(currentIndex: 1),
            CustomIndicator(currentIndex: 2),
          ],
        ),
        NextButton(),
      ],
    );
  }
}
