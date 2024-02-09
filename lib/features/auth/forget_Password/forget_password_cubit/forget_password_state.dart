part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSucess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});
}
