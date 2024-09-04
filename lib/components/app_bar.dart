import 'package:context_app/constants/colors.dart';
import 'package:flutter/material.dart';

class BarApp extends StatelessWidget {
  const BarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          "CONTEXTO",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: AppColors.defaultBackground,
      actions: [
        IconButton(
          icon: const Icon(Icons.lightbulb_outline, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
