import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String tool;
  final String toolName;
  final String type;
  final String size;
  final String backgroundImage;
  const ItemCard(
      {required this.tool,
      required this.type,
      required this.size,
      required this.toolName,
      required this.backgroundImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(
                backgroundImage), // Use the provided background image path
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Text(tool,
                style: const TextStyle(
                  color: Colors.white,
                )),
            Text(
              toolName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Tool Type
                Text(
                  type,
                  style: const TextStyle(color: Colors.white),
                ),
                //Tool Size
                Text(size,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
