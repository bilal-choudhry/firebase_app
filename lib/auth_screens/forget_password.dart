import 'package:firebase_app/controller/page_controllerx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ForgetZPassword extends StatelessWidget {
  var controller = Get.put(PageControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Column(
        children: [
          Text("Email Address or Username"),
          TextField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email/User'),
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await controller.forgetPassword();
              if (response == "Success") {
                Get.snackbar("Email send", "Go Verify");
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
            child: Text("Send"),
          ),
        ],
      ),
    );
  }
}
