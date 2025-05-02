import 'package:flutter/material.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';

class GlobalTextField extends StatefulWidget {
  const GlobalTextField({super.key, this.validator,  this.controller, this.labelText, this.onChanged});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final void Function(String)? onChanged;
  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged:widget.onChanged ,
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Enter text',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.teal, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.teal, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: widget.validator,
    );
  }
}
