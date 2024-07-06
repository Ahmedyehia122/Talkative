part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}
