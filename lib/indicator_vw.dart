import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      duration: Duration(microseconds: 400),
      width: isActive ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.shade400 : Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
