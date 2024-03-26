part of 'signin_bloc.dart';

class SigninState {
  final String phoneNumber;
  const SigninState({ this.phoneNumber = ''});

  SigninState copyWith({String? phoneNumber}) {
    return SigninState(phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}

class SigninSuccess extends SigninState {
  SigninSuccess({required super.phoneNumber});
}

class SigninLoading extends SigninState {
  SigninLoading({required super.phoneNumber});
}

class SigninFailed extends SigninState {
  SigninFailed({required super.phoneNumber});
}
