import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonName;
  final String buttonSubName;
  final VoidCallback onPressed;

  const ArrowButton(
      {required this.iconImagePath,
      required this.buttonName,
      required this.buttonSubName,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[800],
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon
            Row(
              children: [
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(iconImagePath),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buttonName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue.shade100,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      buttonSubName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade200,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
