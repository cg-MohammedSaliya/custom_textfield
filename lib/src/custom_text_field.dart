import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
        this.controller,
        this.isIcon = true,
        this.isPassword = false,
        this.label = '',
        this.myIcon,
        this.block = true,
        this.onChanged,
        this.initialValue,
        this.validator,
        this.numberORtext = true,
        this.maxTextLength = 0,
        required this.hintText,
        this.outlineInputBorder = true,
        this.borderRadius = 12,
        this.prefixIcon = false,
        this.prefixIconSelect,
        this.suffixIcon = false,
        this.suffixIconSelect,
        this.keyboardType,
        this.cursorColor = Colors.black, required this.decoration})
      : super(key: key) {}

  final TextEditingController? controller;
  final bool isPassword;
  final String label;
  final Widget? myIcon;
  final bool isIcon;
  final bool block;
  final void Function(String)? onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool numberORtext;
  final int maxTextLength;
  final String hintText;
  final bool outlineInputBorder;
  final double borderRadius;
  final bool prefixIcon;
  late Widget? prefixIconSelect;
  final bool suffixIcon;
  late Widget? suffixIconSelect;
  final TextInputType? keyboardType;
  final Color cursorColor;
  final Decoration decoration;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: widget.decoration,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        autofocus: false,
        cursorColor: widget.cursorColor,
        validator: widget.validator,
        obscureText: widget.isPassword && !passwordVisible,
        maxLength: widget.maxTextLength != 0 ? widget.maxTextLength : null,
        controller: widget.controller,
        decoration: InputDecoration(
          border: widget.outlineInputBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          )
              : null,
          labelText: widget.label,
          suffixStyle: const TextStyle(),
          prefixIcon: widget.prefixIcon ? widget.prefixIconSelect : null,
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )
              : widget.suffixIcon
              ? widget.suffixIconSelect!
              : null,
        ),
      ),
    );
  }
}
