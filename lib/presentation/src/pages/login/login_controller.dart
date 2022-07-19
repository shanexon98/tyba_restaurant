// ignore_for_file: missing_return

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/src/data/helpers/formControl.dart';
import 'package:tyba_restaurant/presentation/src/data/helpers/validator.dart';
import 'package:tyba_restaurant/presentation/src/data/models/formModel.dart';

import '../../utils/assets.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FormControls form = FormControls(form: {
    'email':
        FormModel(value: '', validators: [validateOptionalEmail, isRequired]),
    'password': FormModel(value: '', validators: [isRequired]),
  });

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void singInWithEmailAndPassword(context) async {
    var height = (MediaQuery.of(context).size.height);
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
              email: form.data['email']!.value,
              password: form.data['password']!.value))
          .user;

      Get.snackbar('Exito!', 'Ingreso exitoso', colorText: Colors.white);

      Future.delayed(const Duration(seconds: 3), () {
        showModalBottomSheet(
          context: context,
          barrierColor: Colors.black38,
          enableDrag: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return SizedBox(
              height: height,
              child: Center(
                  child: Image.asset(
                Assets.loading,
                height: 200,
              )),
            );
          },
        );
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(
            '/home',
          );
        });
      });
    } catch (e) {
      Get.snackbar(
          'Alerta', 'No se pudo iniciar sesión, revise correo o contraseña.',
          colorText: Colors.white);
    }
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text;
  }
}
