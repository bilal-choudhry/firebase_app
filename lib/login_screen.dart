import 'package:firebase_app/page_controllerx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'forget_password.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  var controller = Get.put(PageControllerX());

  @override
  Widget build(BuildContext context) {
    Get.put(PageControllerX());
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Obx(() => SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text("Email Address or Username"),
                  TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email/User'),
                  ),
                  Text("Password"),
                  TextField(
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
                  ElevatedButton(
                    onPressed: () async {
                      var response = await controller.login();
                      if (response == "Success") {
                        Get.snackbar("Success", "User Login");
                      } else {
                        Get.snackbar(
                          "Alert",
                          response.toString(),
                          icon: Icon(
                            Icons.sim_card_alert_rounded,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    child: Text("SignUp"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(ForgetZPassword());
                    },
                    child: Text("Forget Password"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
