import 'package:flutter/material.dart';
import 'package:flutterrestapi2/widgets/input_field.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/register_controller.dart';
import '../../widgets/submit_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  RegisterController registerController = Get.put(RegisterController());
  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;

  // TODO Add registration controller here and login controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text("Api REST TEST",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              isLogin.value = false;
                            },
                            color: !isLogin.value
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            child: Text("New User"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              isLogin.value = true;
                            },
                            color: isLogin.value
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            child: Text("Login"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      isLogin.value ? loginWidget() : registerWidget()
                    ])),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registerController.nameController, 'name'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(registerController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerController.registerWithEmail(),
          title: 'New Account',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginUsingEmail(),
          title: 'Login',
        )
      ],
    );
  }
}
