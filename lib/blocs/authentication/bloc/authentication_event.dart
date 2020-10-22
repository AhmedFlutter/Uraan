part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}


class SignUpUserEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  final UserModel userModel;

  SignUpUserEvent(this.userModel);
}


class SignInUserEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  final String email;
  final String password;

  SignInUserEvent({this.email, this.password});
}

class CheckAuthentication extends AuthenticationEvent {
  @override
  List<Object> get props => [];

}

class SignOutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];

}
