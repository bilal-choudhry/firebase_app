import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/model_class/user.dart' as model;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../helpers/location.dart';
import 'multiple users.dart';
import 'my_details.dart';

class ScreenHomePage extends StatefulWidget {
  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () {
            Get.to(MyDetails());
          }, icon: Text("My Details"),),
          title: Text("Home Page"),
          actions: [
            IconButton(
              onPressed: () {
                Get.offAll(LoginScreen());
              },
              icon: Icon(Icons.logout),
            ),
            IconButton(
              onPressed: () {
                Get.to(MultipleUsers());
              },
              icon: Icon(Icons.outbond),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "User Introduction",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            FutureBuilder<bool>(
              future: checkPermissionStatus(),
              builder: (BuildContext context, permissionSnapshot) {
                if (permissionSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (permissionSnapshot.data == false) {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("Retry"),
                    ),
                  );
                }

                return FutureBuilder<Position>(
                  future: Geolocator.getCurrentPosition(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Latitude: ${snapshot.data?.longitude} ",
                              ),
                              Text(
                                "Longitude: ${snapshot.data?.latitude}",
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}