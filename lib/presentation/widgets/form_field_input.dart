import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/data/models/formModel.dart';

class FormInputFieldWithIcon extends StatefulWidget {
  const FormInputFieldWithIcon(
      {Key? key,
      this.iconPrefix,
      required this.labelText,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines,
      this.formValidation,
      this.onChanged,
      this.onSaved,
      this.onTap,
      this.readOnly = false,
      this.padding = 0,
      this.fillColor = const Color(0xff253341),
      this.maxLenght,
      this.inputFormatters,
      this.textColor = Colors.white})
      : super(key: key);

  final String labelText;
  final Color textColor;
  final Icon? iconPrefix;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final FormModel? formValidation;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool readOnly;
  final double padding;
  final Color fillColor;
  final int? maxLenght;

  final List<TextInputFormatter>? inputFormatters;

  @override
  State<FormInputFieldWithIcon> createState() => _FormInputFieldWithIconState();
}

class _FormInputFieldWithIconState extends State<FormInputFieldWithIcon> {
  late FocusNode focusnode;
  @override
  void initState() {
    focusnode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = widget.formValidation!.value;
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: controller.text.length,
      ),
    );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: widget.padding),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              focusNode: focusnode,
              style: GoogleFonts.mulish(
                  textStyle: const TextStyle(
                color: Color(0xff192646),
                fontSize: 14,
              )),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                counterText: '',
                counterStyle: const TextStyle(fontSize: 0),
                prefixIcon: widget.iconPrefix,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: widget.formValidation!.error.isNotEmpty
                          ? const Color(0xffE2504C)
                          : Colors.transparent,
                      width: 2.0,
                    )),
                fillColor: Colors.white54,
                filled: true,
                labelStyle: TextStyle(
                    color: focusnode.hasFocus
                        ? const Color(0xff192646)
                        : const Color(0xff192646)),
                labelText: widget.labelText,
              ),
              controller: controller,
              onSaved: widget.onSaved,
              onChanged: (a) {
                widget.formValidation!.value = a;
                // ignore: unnecessary_statements
                widget.onChanged != null ? widget.onChanged!(a) : null;
              },
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLenght,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.formValidation!.error.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 20),
                    child: Column(
                      children: [
                        Text(
                          widget.formValidation!.error[0],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 8, 0)),
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ],
    );
  }
}
