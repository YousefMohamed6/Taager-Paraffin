part of 'rest_password_cubit.dart';

@immutable
sealed class RestPasswordState {}

final class RestPasswordInitial extends RestPasswordState {}

final class RestPasswordLoading extends RestPasswordState {}

final class RestPasswordSucess extends RestPasswordState {}

final class RestPasswordFailure extends RestPasswordState {
  final String exceptionMessage;

  RestPasswordFailure({required this.exceptionMessage});
}
