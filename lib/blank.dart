import 'package:flutter/material.dart';

class blank extends StatefulWidget {
  const blank({super.key});

  @override
  State<blank> createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
