import 'package:flutter/material.dart';

class ToolButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final VoidCallback onPressed;
  const ToolButton(
      {required this.iconImagePath,
      required this.buttonText,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[800],
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            //icon
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.black45,
                //     blurRadius: 40,
                //     spreadRadius: 10,
                //   ),
                // ],
              ),
              child: Center(
                child: Image.asset(iconImagePath),
              ),
            ),
            const SizedBox(height: 10),
            //text
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
