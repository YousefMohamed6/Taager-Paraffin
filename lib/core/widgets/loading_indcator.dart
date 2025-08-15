import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tager_paraffin/core/managers/colors_manager.dart';
import 'package:tager_paraffin/core/managers/values_manager.dart';

class LoadingIndictor extends StatelessWidget {
  const LoadingIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: ColorsManager.primaryColor,
        size: ValuesManager.authIconSize,
      ),
    );
  }
}
