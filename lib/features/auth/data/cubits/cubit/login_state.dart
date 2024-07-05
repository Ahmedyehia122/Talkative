part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessfulState extends LoginState {}

final class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}
