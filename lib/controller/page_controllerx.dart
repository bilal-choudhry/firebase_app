import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_app/model_class/user.dart' as model;

import '../auth_screens/screen_home_page.dart';

class PageControllerX extends GetxController {
  //init
  //dispose
  //update
  //refresh
  //clear

  var visibility = true.obs;

  var genderController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Future<String> signUp() async {
  //   String response = '';
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     response = "Success";
  //   }).catchError((error) {
  //     response = error.toString();
  //   });
  //   return response;
  // }

  Future<String> login() async {
    String response = '';
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      response = "Success";
    }).catchError((error) {
      response = error.toString();
    });
    return response;
  }

  Future<String> forgetPassword() async {
    String response = '';
    String email = emailController.text.trim();
    await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
      response = "Success";
    }).catchError((error) {
      response = error.toString();
    });
    return response;
  }

  Future<String> SignUp() async {
    String respon = "";
    String name = nameController.value.text.trim();
    String gender = genderController.value.text.trim();
    String address = addressController.value.text.trim();
    String myemail = emailController.value.text.trim();
    String mypassword = passwordController.value.text.trim();
if (name.isEmpty||gender.isEmpty) {
  return "Field requiem";
}
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: myemail, password: mypassword)
        .then((value) async {
      Get.snackbar("Congratulation", "Your Account is created");
      emailController.clear();
      passwordController.clear();
      var userId = value.user!.uid;
      var user = model.User(
        id: userId,
        name: name,
        email: myemail,
        password: mypassword,
        gender: gender,
        address: address,
        latitude: 0.0,
        blocked: false,
        longitude: 0.0,
        notification_token: "",
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      );
      await FirebaseFirestore.instance
          .collection("user")
          .doc(user.id)
          .set(user.toMap())
          .then((value) {
        respon = "DataSave";
        Get.offAll(ScreenHomePage());
      }).catchError((error) {
        respon = error.toString();
      });
    }).catchError((response) {
      respon = response.toString();
    });

    return respon;
  }
/////

}
