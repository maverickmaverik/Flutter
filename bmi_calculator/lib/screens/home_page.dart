import 'package:flutter/material.dart';
import '../widgets/gender_selection.dart';
import '../widgets/height_selection.dart';
import '../widgets/weight_selection.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedGender = '';
  double height = 170;
  int weight = 60;

  void updateGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void updateHeight(double newHeight) {
    setState(() {
      height = newHeight;
    });
  }

  void updateWeight(int newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void calculateBMI() {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    String classification = '';

    if (selectedGender == 'female') {
      if (bmi < 17) {
        classification = 'Underweight';
      } else if (bmi >= 17 && bmi < 23) {
        classification = 'Normal';
      } else if (bmi >= 23 && bmi < 27) {
        classification = 'Overweight';
      } else {
        classification = 'Obese';
      }
    } else {
      if (bmi < 18) {
        classification = 'Underweight';
      } else if (bmi >= 18 && bmi < 25) {
        classification = 'Normal';
      } else if (bmi >= 25 && bmi < 27) {
        classification = 'Overweight';
      } else {
        classification = 'Obese';
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmi: bmi,
          classification: classification,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          GenderSelection(
            selectedGender: selectedGender,
            onGenderSelected: updateGender,
          ),
          HeightSelection(
            height: height,
            onHeightChanged: updateHeight,
          ),
          WeightSelection(
            weight: weight,
            onWeightChanged: updateWeight,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: selectedGender.isNotEmpty ? calculateBMI : null,
              child: const Text(
                'CALCULATE',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
