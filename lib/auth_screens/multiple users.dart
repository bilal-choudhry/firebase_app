import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/model_class/user.dart' as model;

class MultipleUsers extends StatelessWidget {
  var uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Multiple Users"),
    ),
      body:Container(
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("user").where("id",isNotEqualTo: uid).get(),
          builder: (BuildContext context,snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive(),);
            }
            var users=snapshot.data!.docs.map((e) => model.User.fromMap(e.data() as Map<String,dynamic>)).toList();
            return (users.isEmpty)?Text("No User"):ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                var user=users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.password),
                );
              },);
          },),
      ) ,
    );
  }
}