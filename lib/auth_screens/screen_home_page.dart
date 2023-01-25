import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/model_class/user.dart' as model;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ScreenHomePage extends StatelessWidget {
var uid=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: (){
            Get.offAll(LoginScreen());

          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("user").doc(uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            var user=model.User.fromMap(snapshot.data!.data() as Map<String, dynamic>);
          return ListTile(
            leading: Text(user.name),
            title: Text(user.gender),
          );
        },)
      ],),
    );
  }
}
