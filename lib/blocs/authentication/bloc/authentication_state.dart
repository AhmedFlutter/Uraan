part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}


class SignUpUserSuccessState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignUpUserInProgress extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignUpUserFailsState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignInUserSuccessState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignInUserInProgress extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignInUserFailsState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationFails extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignOutSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}
