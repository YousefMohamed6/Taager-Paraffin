part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSucess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String exceptionMessage;

  RegisterFailure({required this.exceptionMessage});
}
