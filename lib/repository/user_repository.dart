// import 'package:flutter/services.dart';
import 'package:uraan/models/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class UserRepository {
  static UserRepository _userRepository;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DatabaseRepository _database = DatabaseRepository();
  // Firestore _firestore = Firestore.instance;

  factory UserRepository() {
    if (_userRepository == null) {
      _userRepository = UserRepository._createInstance();
    }
    return _userRepository;
  }

  UserRepository._createInstance();

  Future<bool> signInWithCredentials({String email, String password}) async {

    try {
      UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user.uid != null && authResult.user.uid != '') {
         return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> onEmalAddressVerified() async{
    try {

      User _user = _firebaseAuth.currentUser;

      if (_user != null) {
        return _user.emailVerified;
      } else {
        return false;
      }

    } catch (e) {
      print(e.toString());
      return false;

    }
  }

  Future<bool> resetPassword(String email ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print('Caught Exception ${e.toString()}');
      return false;
    }
  }


  Future<bool> checkEmailVerification() async {
    try {

      User user =  _firebaseAuth.currentUser;

      if (user != null) {
        if (user.emailVerified) {

          return true;

        } else {

          return false;

        }
      }

      return false;

    } catch (e) {
      print(e.toString());
      return false;
    }
  }



  // Future<bool> storeNewUser(User user) async {
  //   DocumentReference document = await _firestore.collection('/users').add({
  //     'user_id': user.userId,
  //     'name': user.name,
  //     'email': user.email,
  //     'designation': user.designation,
  //     'phone_no': user.phoneNo,
  //     'user_role': user.userRole
  //   });

  //   if (document.documentID != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> signUp(UserModel user) async {

    try {
       UserCredential signedInUser = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: user.password);

       if(signedInUser.user.uid != null) {
          await signedInUser.user.sendEmailVerification();
          return await _database.storeNewUser(UserModel(
            userID: signedInUser.user.uid,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            cityName: user.cityName,
            mobileNumber: user.mobileNumber,
            houseAddress: user.houseAddress,
            educationLevel: user.educationLevel,
            district: user.district,
            cnic: user.cnic
          ));
       } else {
         return false;
       }
    } on Exception catch (e) {
      print(e.toString());
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<String> getCurrentUserId() async {
    User user = _firebaseAuth.currentUser;

    return user.uid;
  }

  Future<bool> signInUser({String email, String password}) async{
    try{
      UserCredential signInResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if (signInResult.user.emailVerified) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

//   Future<User> getUserData(String userId) async {
//     QuerySnapshot snapshots = await _firestore.collection('/users').where(
//       "user_id",
//       isEqualTo: userId
//     ).getDocuments();



//     Map<String, dynamic> firestoreUserData = snapshots.documents[0].data;

//     if (firestoreUserData != null) {
//       return User(
//         userId: firestoreUserData['user_id'],
//         name: firestoreUserData['name'],
//         email: firestoreUserData['email'],
//         phoneNo: firestoreUserData['phone_no'],
//         designation: firestoreUserData['designation'],
//         userRole: firestoreUserData['user_role']
//       );
//     } else {
//       return User();
//     }
//   }
// }
}
