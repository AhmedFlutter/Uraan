import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uraan/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:uraan/components/custom_surfix_icon.dart';
import 'package:uraan/components/default_button.dart';
import 'package:uraan/models/user_model.dart';
import 'package:uraan/screens/otp_form/otp_form_no_screen.dart';
import 'package:uraan/shared/custom_widgets.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  final ScrollController _formListController;
  SignUpForm(this._formListController);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  // String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cityNameController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _educationLevelController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();
  CustomWidgets _customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
  // ThemeData _theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        // shrinkWrap: true,
        children: [
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is SignUpUserInProgress) {
                _customWidgets.showCustomDialog(
                  context,
                  null,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: Row(
                      children: [
                        CircularProgressIndicator(),
                        Padding(padding: EdgeInsets.only(left: 14.0)),
                        Expanded(child: Text('Creating an Account'))
                      ],
                    ),
                  )
                );
              }
            },
            builder: (context, state) {
              if (state is SignUpUserSuccessState) {
                Navigator.pop(context);
                widget._formListController.jumpTo(0.0);
                return Container(
                  margin: EdgeInsets.only(bottom:20.0),
                  child: _customWidgets.errorOrSuccessMessage(type: "success", msg: "Your account has been created successfully")
                );
              } else if (state is SignUpUserFailsState) {
                Navigator.pop(context);
                widget._formListController.jumpTo(0.0);
                return SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(bottom:20.0),
                    child: _customWidgets.errorOrSuccessMessage(type: "error", msg: "User with this email already Exists"
                  )),
                );
              } else {
                return Container();
              }
            },
          ),
          Container(
              margin: EdgeInsets.only(bottom:20.0),
              child: _customWidgets.errorOrSuccessMessage(type: "error", msg: "User with this email already Exists"
          )),
          TextFormField(
            controller: _firstNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your first name";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _lastNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your last name";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _mobileNoController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your mobile number";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Mobile No",
              hintText: "Enter your mobile no",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _educationLevelController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your education level";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Education level",
              hintText: "Enter your education level",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _cityNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your city name";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "City",
              hintText: "Enter your city name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _cnicController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your CNIC Number";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "CNIC",
              hintText: "Enter your CNIC number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _districtController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your district";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "District",
              hintText: "Enter your district",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: _addressController,
            maxLines: 3,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your house address";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "House Address",
              hintText: "Enter your house address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Sign Up",
            press: () {
              try {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(BlocProvider.of<AuthenticationBloc>(context));
                  BlocProvider.of<AuthenticationBloc>(context).add(SignUpUserEvent(
                    UserModel(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      cityName: _cityNameController.text,
                      mobileNumber: _mobileNoController.text,
                      houseAddress: _addressController.text,
                      educationLevel: _educationLevelController.text,
                      district: _districtController.text,
                      cnic: _cnicController.text
                    )
                  ));
                }
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultColorButton(
            text: "Sign Up with OTP",
            press: () {
                // if all are valid then go to success screen
              Navigator.pushNamed(context, OTPFormNoScreen.routeName);
            },
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if ((password != value)) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (String value) => password = value,
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
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
   return TextFormField(
      controller: _emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
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
