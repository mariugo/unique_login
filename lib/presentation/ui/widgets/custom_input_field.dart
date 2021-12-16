import 'package:flutter/material.dart';

import '/presentation/ui/theme/design_system.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final bool obscureText;
  final Function(String) onSaved;
  final String regEx;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.prefixIconData,
    required this.obscureText,
    required this.onSaved,
    required this.regEx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: DesignSystem.secondaryColor,
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : 'Campo inválido';
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: DesignSystem.primaryColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: DesignSystem.primaryColor,
          ),
        ),
        labelStyle: const TextStyle(
          color: DesignSystem.primaryColor,
        ),
        focusColor: DesignSystem.primaryColor,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.onEditingComplete,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final Function(String) onEditingComplete;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onEditingComplete: () =>
          widget.onEditingComplete(widget.controller.value.text),
      cursorColor: DesignSystem.secondaryColor,
      obscureText: widget.obscureText,
    );
  }
}
