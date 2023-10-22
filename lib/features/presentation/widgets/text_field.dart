import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String) onChanged;
  final TextInputType? inputType;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const InputText(
      {super.key,
      required this.label,
      required this.hintText,
      required this.onChanged,
      this.inputType,
      this.leadingIcon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
            prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
            suffixIcon: trailingIcon != null ? Icon(trailingIcon) : null,
            label: Text(label),
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
