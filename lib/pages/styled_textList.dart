import 'package:flutter/material.dart';

class styled_textList extends StatelessWidget {
  const styled_textList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(8),
      child: const Column(
        // Align texts to the left
        children: [
          Text(
            'Underweight = <18.5',
            style: TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2), // Space between items
          Text(
            'Normal weight = 18.5–24.9',
            style: TextStyle(
                fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2), // Space between items
          Text(
            'Overweight = 25–29.9',
            style: TextStyle(
                fontSize: 18, color: Colors.pink, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2), // Space between items
          Text(
            'Obesity = BMI of 30 or greater',
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
