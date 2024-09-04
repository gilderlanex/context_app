import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final IconData icon;
  const TitleText(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Icon(
          icon,
          color: Colors.grey[500],
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
