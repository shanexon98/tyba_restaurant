import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/src/pages/login/login_controller.dart';
import 'package:tyba_restaurant/presentation/src/pages/register/register_controller.dart';
import 'package:tyba_restaurant/presentation/widgets/form_field_input.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return Column(
        children: [
          FormInputFieldWithIcon(
            maxLenght: 50,
            padding: 35,
            iconPrefix: const Icon(
              Icons.mail,
              color: Color(0xff192646),
            ),
            maxLines: 1,
            keyboardType: TextInputType.text,
            labelText: 'Correo',
            formValidation: _.form.data['email'],
          ),
          const SizedBox(height: 15),
          FormInputFieldWithIcon(
            maxLenght: 50,
            padding: 35,
            iconPrefix: const Icon(
              Icons.lock,
              color: Color(0xff192646),
            ),
            maxLines: 1,
            keyboardType: TextInputType.text,
            labelText: 'Contraseña',
            formValidation: _.form.data['password'],
          ),
        ],
      );
    });
  }
}
