import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uraan/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:uraan/screens/business_feasibilities/rural_business_screen.dart';
import 'package:uraan/screens/business_feasibilities/urban_business_screen.dart';
import 'package:uraan/screens/business_feasibilities/women_business_screen.dart';
import 'package:uraan/screens/complete_profile/complete_profile_screen.dart';
import 'package:uraan/screens/forgot_password/forgot_password_screen.dart';
import 'package:uraan/screens/interships/internship_screen.dart';
import 'package:uraan/screens/jobs/jobs_all_over_pakistan.dart';
import 'package:uraan/screens/jobs/jobs_with_in_punjab.dart';
import 'package:uraan/screens/login_success/login_success_screen.dart';
import 'package:uraan/screens/otp/otp_screen.dart';
import 'package:uraan/screens/otp_form/otp_form_no_screen.dart';
import 'package:uraan/screens/scholarships/scholarship_international_screen.dart';
import 'package:uraan/screens/scholarships/scholarship_national_screen.dart';
import 'package:uraan/screens/short_courses/short_course.dart';
import 'package:uraan/screens/sign_in/sign_in_screen.dart';
import 'package:uraan/screens/splash/splash_screen.dart';
import 'package:uraan/screens/training_workshops/training_workshop.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => BlocProvider<AuthenticationBloc>(create:(context) => AuthenticationBloc()..add(CheckAuthentication()),child: SplashScreen()),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(), child: SignUpScreen()),
  SignInScreen.routeName: (context) => BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(), child: SignInScreen()),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ScholarShipNationalScreen.routeName: (context) => BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(), child: ScholarShipNationalScreen()),
  ScholarShipInterNationalScreen.routeName: (context) => ScholarShipInterNationalScreen(),
  JobsWithInPunjabScreen.routeName: (context) => JobsWithInPunjabScreen(),
  JobsAllOverPakistan.routeName: (context) => JobsAllOverPakistan(),
  InternshipScreen.routeName: (context) => InternshipScreen(),
  TrainingWorkshops.routeName: (context) => TrainingWorkshops(),
  ShortCourses.routeName: (context) => ShortCourses(),
  OTPFormNoScreen.routeName: (context) => OTPFormNoScreen(),
  UrbanBusinesses.routeName: (context) => UrbanBusinesses(),
  RuralBusinesses.routeName: (context) => RuralBusinesses(),
  WomenBusinesses.routeName: (context) => WomenBusinesses(),
};
