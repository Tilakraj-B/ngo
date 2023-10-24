import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String? label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function() onPressed;
  const LargeButton(
      {super.key,
      this.label,
      this.leadingIcon,
      this.trailingIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: CupertinoButton(
          color: Colors.black,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(leadingIcon),
              Text(label ?? ""),
              Icon(trailingIcon)
            ],
          )),
    );
  }
}
