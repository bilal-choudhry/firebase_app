import 'package:firebase_app/page_controllerx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {

  var controller = Get.put(PageControllerX());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Obx(()=>SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Text("First Name"),
                SizedBox(height: 10,),
                TextField(
                  controller: controller.firstnameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'First Name'
                  ),
                ),
                SizedBox(height: 10,),
                Text("Second Name"),
                SizedBox(height: 10,),
                TextField(
                  controller: controller.secondnameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Second Name'
                  ),
                ),
                SizedBox(height: 10,),
                Text("Email Address or Username"),
                SizedBox(height: 10,),
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email/User'
                  ),
                ),
                SizedBox(height: 10,),
                Text("Password"),
                SizedBox(height: 10,),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.visibility.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                    onPressed: () {
                      controller.visibility.value = !(controller.visibility.value);
                    },

                    icon: Icon(controller.visibility.value == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
                ),
                ElevatedButton(onPressed: ()

                  async{
                    var response = await controller.signUp();
                    if (response == "Success") {
                      Get.snackbar("Success", "User Login");
                      controller.dispose();
                      Get.offAll(LoginScreen());
                    }
                    else{
                      Get.snackbar("Alert", response.toString());
                      controller.emailController = '' as TextEditingController;
                      Get.offAll(LoginScreen());
                    }

                  },

                 child: Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
