import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signInUser(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errMessage: 'No user found for that email'));
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            errMessage: 'Wrong password provided for that user.'));
        // print('Wrong password provided for that user.');
      }
    } on Exception catch (e) {
      emit(
        LoginFailureState(
          errMessage: 'Something went wrong please try again later!',
        ),
      );
    }
  }
}
