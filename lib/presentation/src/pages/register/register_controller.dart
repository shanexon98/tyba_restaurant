import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/src/data/helpers/formControl.dart';
import 'package:tyba_restaurant/presentation/src/data/helpers/validator.dart';
import 'package:tyba_restaurant/presentation/src/data/models/formModel.dart';

import '../home/home_page.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late bool sucess = false;
  late String userEmail = '';
  FormControls form = FormControls(form: {
    'email': FormModel(value: '', validators: [isRequired]),
    'password': FormModel(value: '', validators: [isRequired]),
  });

  void goToLoginPage() {
    Get.toNamed('/login');
  }

  void registerUser() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: form.data['email']!.value,
            password: form.data['password']!.value))
        .user;
    Get.snackbar('Exito!', 'Registro exitoso', colorText: Colors.white);
    if (user != null) {
      sucess = true;
      Future.delayed(const Duration(seconds: 2), () {
        Get.to(const HomePage());
      });
      userEmail = user.email!;
    } else {
      sucess = false;
    }
  }
  // void register() {
  //   String email = emailController.text.trim();
  //   String name = nameController.text;
  //   String lastname = lastnameController.text;
  //   String phone = phoneController.text;
  //   String password = passwordController.text.trim();
  //   String confirmPassword = confirmPasswordController.text.trim();
  // }

  void register() {}
}
