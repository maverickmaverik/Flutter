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
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF8D8E98),
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
                  color: Color(0xFF8D8E98),
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: const Color(0xFF8D8E98),
              thumbColor: Colors.pink,
              overlayColor: Colors.pink.withAlpha(29),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: height,
              min: 120,
              max: 220,
              onChanged: onHeightChanged,
            ),
          ),
        ],
      ),
    );
  }
}
