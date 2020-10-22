import 'package:flutter/material.dart';

import 'components/body.dart';

class OTPFormNoScreen extends StatelessWidget {
  static String routeName = "/otp_form_no";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Form"),
      ),
      body: Body(),
    );
  }
}
