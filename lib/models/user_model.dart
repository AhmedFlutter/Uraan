import 'package:equatable/equatable.dart';

class UserModel extends Equatable {

  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String mobileNumber;
  final String educationLevel;
  final String cityName;
  final String district;
  final String houseAddress;
  final String cnic;

  UserModel({this.userID, this.firstName, this.lastName, this.email, this.password, this.confirmPassword, this.mobileNumber, this.educationLevel, this.cityName, this.district, this.houseAddress, this.cnic});
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "userId:$userID, firstName:$firstName, lastName:$lastName, email:$email, password:$password, mobileNumber:$mobileNumber, educationLevel:$educationLevel, cityName:$cityName, district:$district, houseAddress:$houseAddress, cnic:$cnic";
  }
}
