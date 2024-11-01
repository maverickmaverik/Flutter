import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelection({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onGenderSelected('male'),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: selectedGender == 'male'
                      ? const Color(0xFF1D1E33)
                      : const Color(0xFF111328),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      size: 80,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'MALE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () => onGenderSelected('female'),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: selectedGender == 'female'
                      ? const Color(0xFF1D1E33)
                      : const Color(0xFF111328),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      size: 80,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'FEMALE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
