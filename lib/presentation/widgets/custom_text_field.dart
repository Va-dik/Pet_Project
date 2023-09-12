import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.type = TextInputType.text,
      this.fieldColor = const Color(0xFFF6F6F9)});
  final String labelText;
  final TextEditingController controller;
  final TextInputType? type;
  Color fieldColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();

  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+7 (9**) ***-**-**',
    filter: {"9": RegExp(r'[9]'), "*": RegExp(r'[0-9]')},
  );

  void updateMask(String text) {
    String mask = '+7 (***) ***-**-**';
    for (int i = 0; i < text.length; i++) {
      if (i < mask.length) {
        {
          mask = mask.replaceRange(i, i + 1, text[i]);
        }
      }
    }

    widget.controller.text = mask;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              border: InputBorder.none,
              fillColor: widget.fieldColor,
              filled: true,
              labelText: widget.labelText,
              errorStyle: const TextStyle(height: 0),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelStyle: const TextStyle(
                fontFamily: 'SF Pro Display',
                color: Color(0xFFA8ABB6),
              ),
            ),
            controller: widget.controller,
            inputFormatters: widget.labelText == StringConstants.phoneNum
                ? [maskFormatter]
                : null,
            keyboardType: widget.type,
            onFieldSubmitted: (email) {
              if (!formKey.currentState!.validate()) {
                widget.fieldColor = const Color(0x00eb5757).withOpacity(0.15);
              } else {
                widget.fieldColor = const Color(0xFFF6F6F9);
              }
            },
            onTap: widget.type == TextInputType.phone
                ? () => widget.controller.text = '+7 (***) ***-**-**'
                : null,
            onTapOutside: (_) {
              if (!formKey.currentState!.validate() &&
                  widget.controller.text.isNotEmpty) {
                widget.fieldColor = const Color(0x00eb5757).withOpacity(0.15);
              } else {
                widget.fieldColor = const Color(0xFFF6F6F9);
              }
              focusNode.unfocus();
            },
            onChanged: widget.type == TextInputType.phone
                ? (text) => updateMask(text)
                : null,
            validator: widget.type == TextInputType.emailAddress
                ? (email) {
                    if (email != null) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        setState(() {});
                      });

                      if (email.isNotEmpty) {
                        if (!isValidEmail(email)) {
                          return '';
                        }
                      }
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
