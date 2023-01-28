import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/model_class/user.dart' as model;

class MyDetails extends StatefulWidget {

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  var user = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Details"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(user)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator
                    .adaptive());
          }
          var user = model.User.fromMap(snapshot.data!
              .data() as Map<String, dynamic>);
          return Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                "User address:: ${user.address}",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "User Name:: ${user.name}",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "User Gender:: ${user.gender}",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "User ID:: ${user.id}",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          );
        },
      ),
    );
  }
}
