import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String classification;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.classification,
  });

  String get message {
    switch (classification) {
      case 'Underweight':
        return 'Consider consulting with a healthcare provider about nutrition';
      case 'Normal':
        return 'Your weight is within typical range';
      case 'Overweight':
        return 'Consider consulting with a healthcare provider about lifestyle changes';
      case 'Obese':
        return 'Recommended to discuss health options with your healthcare provider';
      default:
        return '';
    }
  }

  Color _getClassificationColor() {
    final colors = {
      'Underweight': Colors.yellow,
      'Normal': Colors.green,
      'Overweight': Colors.orange,
      'Obese': Colors.red,
    };
    return colors[classification] ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your Result',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    classification.toUpperCase(),
                    style: TextStyle(
                      color: _getClassificationColor(),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(100, 0, 255, 0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
