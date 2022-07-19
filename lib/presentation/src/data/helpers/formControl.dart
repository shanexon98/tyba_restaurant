// ignore: file_names
import '../models/formModel.dart';

class FormControls {
  Map<String, FormModel> form;
  Map<String, FormModel> get data => form;
  FormControls({required this.form});
  bool validate() {
    bool validate = false;
    form.forEach((key, value) {
      value.error = [];
      for (var valid in value.validators) {
        final error = valid(value.value);
        if (error != null) {
          form[key]!.error.add(error);
          validate = true;
        }
      }
    });
    return validate;
  }

  Map<String, dynamic> value() {
    return form.map((key, value) {
      return MapEntry(key, value.value);
    });
  }

  void dispose() {}
}
