import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:tager_paraffin/core/managers/keys_manager.dart';
import 'package:tager_paraffin/core/managers/secure_storage_service.dart';
import 'package:tager_paraffin/features/auth/login/view/login_view.dart';

part 'on_board_cubit.freezed.dart';
part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit() : super(OnBoardState.initial());
  final PageController onBoardController = PageController();

  void onPageChanged(int index) {
    onBoardController.jumpToPage(index);
    emit(OnBoardState<int>.success(index));
  }

  Future<void> nextPage(BuildContext context) async {
    if (onBoardController.page == 2) {
      await SecureStorageManager.storage
          .write(key: KeysManager.kIsFirstOpenApp, value: 'true');
      if (context.mounted) {
        GoRouter.of(context).goNamed(LoginView.routeName);
      }
    } else {
      onBoardController.nextPage(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeIn,
      );
    }
  }
}
