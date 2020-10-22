import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uraan/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:uraan/components/custom_surfix_icon.dart';
import 'package:uraan/screens/forgot_password/forgot_password_screen.dart';
import 'package:uraan/screens/login_success/login_success_screen.dart';
import 'package:uraan/shared/custom_widgets.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  // String email;
  String password;
  bool remember = false;
  TextEditingController emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  CustomWidgets _customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is SignInUserInProgress) {
                _customWidgets.showCustomDialog(
                  context,
                  null,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: Row(
                      children: [
                        CircularProgressIndicator(),
                        Padding(padding: EdgeInsets.only(left: 14.0)),
                        Expanded(child: Text('Signing In'))
                      ],
                    ),
                  )
                );
              } else if (state is SignInUserSuccessState) {
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
            builder: (context, state) {
              if (state is SignInUserFailsState) {
                Navigator.pop(context);
                return Container(
                  margin: EdgeInsets.only(bottom:20.0),
                  child: _customWidgets.errorOrSuccessMessage(type: "error", msg: "Email or Password Incorrect"
                ));
              } else {
                return Container();
              }
            },
          ),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          // FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(password);
                BlocProvider.of<AuthenticationBloc>(context).add(SignInUserEvent(
                  email: emailController.text,
                  password: password
                ));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      // controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => password = value,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
