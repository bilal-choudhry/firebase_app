import 'package:firebase_app/controller/page_controllerx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  var controller = Get.put(PageControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Text("First Name"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Gender"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.genderController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Gender'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Address"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.addressController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Email Address or Username"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email/User'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Password"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.visibility.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                    onPressed: () {
                      controller.visibility.value =
                          !(controller.visibility.value);
                    },
                    icon: Icon(controller.visibility.value == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
                ),
                ElevatedButton(onPressed: () async{
                  var response=await controller.SignUp();
                  if (response=="DataSave") {
                    Get.snackbar("title", response);
                  }
                  else{
                    Get.snackbar("title", response);

                  }
                }, child: Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
