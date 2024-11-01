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
        return 'You should eat more nutritious food to gain some weight!';
      case 'Normal':
        return 'You have a normal body weight. Good job!';
      case 'Overweight':
        return 'You should exercise more to lose some weight!';
      case 'Obese':
        return 'You should seriously consider a diet and exercise routine!';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
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
                color: const Color(0xFF1D1E33),
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
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getClassificationColor() {
    switch (classification) {
      case 'Underweight':
        return Colors.yellow;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
