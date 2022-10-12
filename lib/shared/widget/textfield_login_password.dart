import 'package:flutter/material.dart';

class QTextfieldLoginPassword extends StatefulWidget {
  final String value;
  final Function(String value) onChanged;
  final String? label;
  final Color? ctext;
  final Color? iconColor;
  final Color? focusIconColor;

  const QTextfieldLoginPassword({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.ctext,
    this.iconColor,
    this.focusIconColor,
  }) : super(key: key);

  @override
  State<QTextfieldLoginPassword> createState() =>
      _QTextfieldLoginPasswordState();
}

class _QTextfieldLoginPasswordState extends State<QTextfieldLoginPassword> {
  bool hidden = false;
  changeStatus() {
    hidden = !hidden;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => widget.onChanged(value),
      obscureText: hidden,
      decoration: InputDecoration(
        labelText: widget.label ?? "Password",
        labelStyle: TextStyle(
          color: widget.ctext ?? Colors.black,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            hidden ? Icons.visibility_off : Icons.visibility,
            color: widget.iconColor ?? Colors.green,
          ),
          onPressed: (() {
            changeStatus();
          }),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: widget.focusIconColor ?? Colors.grey,
        )),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.ctext ?? Colors.grey,
          ),
        ),
      ),
    );
  }
}
