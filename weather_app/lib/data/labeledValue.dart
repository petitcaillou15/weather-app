import 'package:flutter/material.dart';

class Labeledvalue extends StatelessWidget {
  final String label;
  final String value;

  const Labeledvalue({super.key, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(label), Text(value)]);
  }
}
