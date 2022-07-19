// ignore: file_names
import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));
String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel<T> {
  FormModel({
    required this.value,
    required this.validators,
    this.error = const [],
  });
  T? value;
  List<Function> validators;
  List error;
  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        value: json["value"],
        validators: List<Function>.from(json["validators"].map((x) => x)),
        error: json["error"],
      );
  Map<String, dynamic> toJson() => {
        "value": value,
        "validators": List<Function>.from(validators.map((x) => x)),
        "error": error,
      };

  setvalidators(validator) {
    validators = validator;
  }
}
