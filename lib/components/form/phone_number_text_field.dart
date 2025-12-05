import 'package:admin_panel/components/components.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.phone,
      label: 'Номер телефона',
      hintText: '+996 XXX XX XX XX',
      controller: controller,
      suffixIcon: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          return Visibility(
            visible: value.text.trim().isNotEmpty,
            child: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () => controller.clear(),
            ),
          );
        },
      ),
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '+996 XXX XX XX XX',
          filter: {"X": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.eager,
        ),
      ],
    );
  }
}
