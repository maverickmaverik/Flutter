import 'package:flutter/material.dart';
import 'package:dice_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  final GlobalKey<DiceRollerState> _diceKey1 = GlobalKey<DiceRollerState>();
  final GlobalKey<DiceRollerState> _diceKey2 = GlobalKey<DiceRollerState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.color1, widget.color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiceRoller(key: _diceKey1), 
              const SizedBox(width: 40),  
              DiceRoller(key: _diceKey2), 
            ],
          ),
          const SizedBox(height: 40), 
          ElevatedButton(
            onPressed: () {
              _diceKey1.currentState?.rollDice();
              _diceKey2.currentState?.rollDice();
            },
            child: const Text('Roll the Dice!'),
          ),
        ],
      ),
    );
  }
}
