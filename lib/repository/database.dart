import 'package:firebase_database/firebase_database.dart';
import 'package:uraan/models/user_model.dart';

class DatabaseRepository {
  static DatabaseRepository _database;
  DatabaseReference _dbRef = FirebaseDatabase.instance.reference();

  factory DatabaseRepository() {
    if (_database == null) {
      _database = DatabaseRepository._createInstance();
    }
    return _database;
  }

  DatabaseRepository._createInstance();

  Future<bool> storeNewUser(UserModel user) async {
    try {
      _dbRef.child('users').push().set({
        'user_id': user.userID,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'mobileNumber': user.mobileNumber,
        'educationLevel': user.educationLevel,
        'cityName': user.cityName,
        'district': user.district,
        'houseAddress': user.houseAddress,
        'cnic': user.cnic
      });

      return true;
    } catch (e) {
      print("Caught Exception: ${e.toString()}");
      return false;
    }
  }

  Future<bool> checkUserNotExists(String email) async {
    try {

      DataSnapshot snapshot = await _dbRef.child("users").orderByChild('email').equalTo(email).once();

      if (snapshot.value != null) {
        return false;
      } else {
        return true;
      }

    } catch (e) {
      print("Caught Exception ${e.toString()}");
      return true;
    }
  }

}
