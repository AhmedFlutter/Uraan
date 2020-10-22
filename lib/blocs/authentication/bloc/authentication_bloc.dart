import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uraan/models/user_model.dart';
import 'package:uraan/repository/database.dart';
import 'package:uraan/repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  UserRepository _userRepository = UserRepository();
  DatabaseRepository _databaseRepository = DatabaseRepository();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignUpUserEvent) {
      yield* _mapSignUpUserEventToState(event);
    } else if (event is SignInUserEvent) {
      yield* _mapSignInUserEventToState(event);
    } else if (event is CheckAuthentication){
      yield* _mapCheckAuthenticationEventToState();
    } else if (event is SignOutEvent){
      yield* _mapSignOutEventToState();
    }
  }

  Stream<AuthenticationState> _mapSignUpUserEventToState(SignUpUserEvent event) async* {
    try {
      yield SignUpUserInProgress();
      bool checkUserNotExists = await _databaseRepository.checkUserNotExists(event.userModel.email);

      if (checkUserNotExists) {
        bool signUpUser = await _userRepository.signUp(event.userModel);

        if (signUpUser) {
          yield SignUpUserSuccessState();
        } else {
          yield SignUpUserFailsState();
        }
      } else {
        yield SignUpUserFailsState();
      }

    } on Exception catch (e) {
      print(e.toString());
      yield SignInUserFailsState();

    } catch (e) {
      print(e.toString());
      yield SignInUserFailsState();
    }

  }

  Stream<AuthenticationState> _mapSignInUserEventToState(SignInUserEvent event) async*{
    try{
      yield SignInUserInProgress();

      bool signInResult = await _userRepository.signInUser(email: event.email, password: event.password);

      if (signInResult) {
        yield SignInUserSuccessState();
      } else {
        yield SignInUserFailsState();
      }

    } on Exception catch (e) {
      print(e.toString());
      yield SignInUserFailsState();

    } catch (e) {
      print(e.toString());
      yield SignInUserFailsState();
    }
  }

  Stream<AuthenticationState> _mapCheckAuthenticationEventToState() async*{
    try {
      bool emailAddressVerified = await _userRepository.onEmalAddressVerified();
      if (emailAddressVerified) {
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationFails();
      }
    } catch (e) {
      print("Caught Exception ${e.toString()}");
    }
  }

  Stream<AuthenticationState> _mapSignOutEventToState() async*{
    try {
      bool signOut = await _userRepository.signOut();
      if (signOut) {
        yield SignOutSuccess();
      }
    } catch (e) {
      print("Caught Exception ${e.toString()}");
    }
  }


}
