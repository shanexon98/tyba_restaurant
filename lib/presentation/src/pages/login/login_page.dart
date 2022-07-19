import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tyba_restaurant/presentation/src/pages/login/login_controller.dart';
import 'package:tyba_restaurant/presentation/src/pages/login/widgets/loginfoms.dart';
import 'package:tyba_restaurant/presentation/widgets/form_field_input.dart';

class LoginPage extends StatelessWidget {
  LoginController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Container(
              color: const Color(0xff192646), child: _textDontHaveAccount()),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80"),
                  fit: BoxFit.cover)),
          child: Center(
            child: ClipRect(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white54)),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.height * 0.45,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        _textYourInfo(),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: LoginForms(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (!_.form.validate()) {
                                  _.singInWithEmailAndPassword(context);
                                }
                                _.update(['formregister']);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff192646),
                                  padding: const EdgeInsets.all(20)),
                              child: const Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1,
      color: const Color(0xff192646),
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 45),
        child: const Text(
          'Bienvenid@',
          style: TextStyle(
              color: Colors.white70, fontSize: 40, fontWeight: FontWeight.w900),
        ));
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.white54, fontSize: 17),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: const Text(
            'Registrate Aqui',
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
      ],
    );
  }
}
