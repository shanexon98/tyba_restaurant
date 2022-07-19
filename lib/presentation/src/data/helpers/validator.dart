// matching various patterns for kinds of data

// ignore_for_file: empty_catches

import 'package:get/get.dart';

class Validator {
  Validator();

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.password'.tr;
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty'.tr;
    } else {
      return null;
    }
  }
}

String? isRequired(dynamic value) {
  if (value.isEmpty) {
    return 'Campo obligatorio';
  }
  return null;
}

String? isRequiredPhone(dynamic value) {
  if (value.isEmpty) {
    return 'NumberEmpty.register'.tr;
  }
  return null;
}

String? phoneNumberInvalid(dynamic value) {
  return 'NumberEmpty.register'.tr;
}

String? isFileRequired(dynamic value) {
  try {
    if (value.toString().isEmpty) {
      return 'valueInvalid.validator'.tr;
    }
    return null;
  } catch (e) {
    return null;
  }
}

String? noRequired(dynamic value) {
  return null;
}

String? isFileOptional(dynamic value) {
  return 'valueInvalid.validator'.tr;
}

String? validateEmail(String value) {
  if (!GetUtils.isEmail(value)) {
    return 'emailInValid.validator'.tr;
  }
  return null;
}

String? validatePassword(String value) {
  String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[~!?@#$%^=&*\\])(?=.*[0-9]).{3,15}$';

  //  r'^(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){1})(?=(?:.*[@$?¡\-_]){1})\S{8,16}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Caracteres especiales, números y mayúsculas.'.tr;
  }
  return null;
}

String? validateCheck(bool value) {
  if (!value) {
    return 'passwordInvalid.validator'.tr;
  }
  return null;
}

String? validateOptionalEmail(String value) {
  if (value.isEmpty) {
    return null;
  }

  if (!GetUtils.isEmail(value)) {
    return 'Ingrese un correo valido';
  }
  return null;
}

String? validateText(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'textInvalid.validator'.tr;
  }
  return null;
}

String? validatePhone(String value) {
  if (value.isEmpty) {
    return 'NumberEmpty.register'.tr;
  }

  if (value.length != 10) {
    return 'noValidPhone.register'.tr;
  }

  return null;
}

String? isMotoCyclePlate(String value) {
  String pattern = r'(^([a-zA-Z]{3}[a-zA-Z\d]{3})$)';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'plateInvalid.validator'.tr;
  }
  return null;
}

String? isCarPlate(String value) {
  String pattern = r'^([a-zA-Z]{3}[\d]{3})$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'plateInvalid.validator'.tr;
  }
  return null;
}

String? isCylinder(String value) {
  if (value == '') {
    return 'numberInvalid.validator'.tr;
  }
  var s = int.parse(value);
  if (s >= 100 && s <= 1200) {
    return null;
  }
  return 'numberInvalid.validator'.tr;
}

String? isOlder(String value) {
  var m = double.parse(value);
  if (m > 5) {
    return null;
  }
  return 'numberInvalid.validator'.tr;
}

String? isYear(String value) {
  if (value == '') {
    return 'numberInvalid.validator'.tr;
  }
  var s = int.parse(value);
  if (s > 1985 && s < 2023) {
    return null;
  }
  return 'numberInvalid.validator'.tr;
}

String? isNumber(String value) {
  if (!GetUtils.isNumericOnly(value)) {
    return 'numberInvalid.validator'.tr;
  }
  return null;
}

String? isYearOld(String value) {
  if (value == '') {
    return 'numberInvalid.validator'.tr;
  }

  var s = int.parse(value);
  if (s >= 18 && s <= 70) {
    return null;
  }

  return 'numberInvalid.validator'.tr;
}

String? isName(String value) {
  String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'textInvalid.validator'.tr;
  } else {
    return null;
  }
}

String? isNumberDocument(String value) {
  if (value.length < 6 || value.length > 10) {
    return 'numberInvalid.validator'.tr;
  }

  if (!GetUtils.isNumericOnly(value)) {
    return 'numberInvalid.validator'.tr;
  }
  return null;
}

String? isNumberForeignerID(String value) {
  if (value.length < 6 || value.length > 7) {
    return 'numberInvalid.validator'.tr;
  }

  if (!GetUtils.isNumericOnly(value)) {
    return 'numberInvalid.validator'.tr;
  }
  return null;
}

String? isNumberDNI(String value) {
  if (value.length > 9) {
    return 'numberInvalid.validator'.tr;
  }

  if (!GetUtils.isNumericOnly(value)) {
    return 'numberInvalid.validator'.tr;
  }
  return null;
}

String? isNumberPEP(String value) {
  if (value.length > 15) {
    return 'numberInvalid.validator'.tr;
  }

  if (!GetUtils.isNumericOnly(value)) {
    return 'numberInvalid.validator'.tr;
  }
  return null;
}

String? isNumberPassport(String value) {
  if (value.length > 13 || value.length < 6) {
    return 'numberInvalid.validator'.tr;
  }

  int i = 0;

  String pattern = r'[a-zA-Z]';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(value)) {
    i++;
  }

  String pattern2 = r'[0-9]';
  RegExp regExp2 = RegExp(pattern2);
  if (regExp2.hasMatch(value)) {
    i++;
  }

  if (i != 2) {
    return 'numberInvalid.validator'.tr;
  }

  return null;
}

class Max {
  final int max;
  Max({required this.max});
  String? validate(String val) {
    try {
      final i = int.tryParse(val);
      return i!.compareTo(max) >= 5 ? 'Digite al menos 10 digitos' : null;
    } catch (e) {}
    return null;
  }
}

class Min {
  final int min;
  Min({required this.min});
  bool validate(String val) {
    bool isMin = false;
    try {
      final i = int.tryParse(val);
      isMin = i!.compareTo(min) < 0 ? false : true;
    } catch (e) {}
    return isMin;
  }
}
