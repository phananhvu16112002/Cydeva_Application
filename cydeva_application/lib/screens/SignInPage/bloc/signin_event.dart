part of 'signin_bloc.dart';

class SigninEvent {}

class PhoneNumberChanged extends SigninEvent {
  final String phoneNumber;
  PhoneNumberChanged({required this.phoneNumber});
}

class SignInSubmiited extends SigninEvent {
  SignInSubmiited();
}
