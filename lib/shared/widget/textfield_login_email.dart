import 'package:fhe_template/shared/util/input.dart';
import 'package:flutter/material.dart';

class QTextfieldLoginEmail extends StatefulWidget {
  final String id;
  final String? value;
  final Function(String value) onChanged;
  final String? label;
  final IconData? cicon;
  final Color? iconColor;
  final Color? ctext;
  final Color? focusIconColor;

  const QTextfieldLoginEmail(
      {Key? key,
      this.value,
      required this.onChanged,
      required this.id,
      this.label,
      this.cicon,
      this.iconColor,
      this.ctext,
      this.focusIconColor})
      : super(key: key);

  @override
  State<QTextfieldLoginEmail> createState() => _QTextfieldLoginEmailState();
}

class _QTextfieldLoginEmailState extends State<QTextfieldLoginEmail>
    implements InputControllerState {
  String? inputValue;

  @override
  setValue(value) {
    inputValue = value;
    setState(() {});
  }

  @override
  getValue() {
    return inputValue;
  }

  @override
  void dispose() {
    super.dispose();
    inputControllers.remove(widget.id);
  }

  @override
  void initState() {
    inputValue = widget.value;
    inputControllers[widget.id] = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      onChanged: (value) {
        widget.onChanged(value);
        inputValue = value;
      },
      cursorColor: widget.iconColor ?? Colors.green,
      decoration: InputDecoration(
        labelText: widget.label ?? "Email",
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.red,
        focusColor: Colors.pink,
        suffixIcon: Icon(
          widget.cicon ?? Icons.email_outlined,
          color: widget.iconColor ?? Colors.green,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusIconColor ?? Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class TtextfieldEmail extends StatefulWidget {
  final String id;
  final String? value;
  final Function(String value) onChanged;
  final String? label;
  final IconData? cicon;
  final Color? iconColor;
  final Color? ctext;
  final Color? focusIconColor;

  const TtextfieldEmail({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    required this.id,
    this.cicon,
    this.iconColor,
    this.ctext,
    this.focusIconColor,
  }) : super(key: key);

  @override
  State<TtextfieldEmail> createState() => _TtextfieldEmailState();
}

class _TtextfieldEmailState extends State<TtextfieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.onChanged(value);
      },
      cursorColor: widget.iconColor ?? Colors.green,
      decoration: InputDecoration(
        labelText: widget.label ?? "Email",
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.red,
        focusColor: Colors.pink,
        suffixIcon: Icon(
          widget.cicon ?? Icons.email_outlined,
          color: widget.iconColor ?? Colors.green,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusIconColor ?? Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
