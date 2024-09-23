import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController pinController = TextEditingController();


  ///variables
  final RxBool showPassword = true.obs;
  final RxBool isTermsAccepted = false.obs;




  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }
}