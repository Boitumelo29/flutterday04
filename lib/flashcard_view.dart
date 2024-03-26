import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  final String title;
  const FlashCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
