import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {

  final String name;
  const ThirdScreen({super.key, required this.name});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Third Screen ${widget.name}'),
      ),
      body: const Placeholder(),
    );
  }
}
