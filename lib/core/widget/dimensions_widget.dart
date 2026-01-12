import 'package:flutter/material.dart';

class GapX extends StatelessWidget {
  final double value;
  const GapX({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value,);
  }
}
class GapY extends StatelessWidget {
  final double value;
  const GapY({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value,);
  }
}