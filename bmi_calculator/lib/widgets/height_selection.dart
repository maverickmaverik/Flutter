import 'package:flutter/material.dart';

class HeightSelection extends StatelessWidget {
  final double height;
  final Function(double) onHeightChanged;

  const HeightSelection({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 100, 100, 100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.round().toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'cm',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color.fromARGB(255, 0, 0, 0),
              inactiveTrackColor: const Color.fromARGB(255, 100, 100, 100),
              thumbColor: const Color.fromARGB(255, 0, 0, 0),
              overlayColor: const Color.fromARGB(255, 0, 0, 0).withAlpha(29),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: height,
              min: 140,
              max: 220,
              onChanged: onHeightChanged,
            ),
          ),
        ],
      ),
    );
  }
}
