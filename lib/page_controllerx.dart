import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageControllerX extends GetxController{
  //init
  //dispose
  //update
  //refresh
  //clear

  var visibility = true.obs  ;
  var secondnameController = TextEditingController();
  var firstnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


    Future<String> signUp() async{
      String response='';
      String email=emailController.text.trim();
      String password=passwordController.text.trim();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        response="Success";
      }).catchError((error){
        response=error.toString();
      });
      return response;
    }

    Future<String> login() async{
      String response='';
      String email=emailController.text.trim();
      String password=passwordController.text.trim();
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        response="Success";
      }).catchError((error){
        response=error.toString();
      });
      return response;
    }
  Future<String> forgetPassword() async{
    String response='';
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email,).then((value) {
      response="Success";
    }).catchError((error){
      response=error.toString();
    });
    return response;
  }




}