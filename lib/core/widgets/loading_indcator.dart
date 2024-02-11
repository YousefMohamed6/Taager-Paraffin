import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tager_paraffin/core/uitls/colors_manager.dart';
import 'package:tager_paraffin/core/uitls/values_manager.dart';

class LoadingIndictor extends StatelessWidget {
  const LoadingIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: ColorManager.primary,
        size: ValuesManager.authIconSize,
      ),
    );
  }
}
