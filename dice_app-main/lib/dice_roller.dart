import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll1 = 2;
  var currentDiceRoll2 = 2;

  void rollBothDice() {
    setState(() {
      currentDiceRoll1 = randomizer.nextInt(6) + 1;
      currentDiceRoll2 = randomizer.nextInt(6) + 1;
    });
  }

  void rollDice1() {
    setState(() {
      currentDiceRoll1 = randomizer.nextInt(6) + 1;
    });
  }

  void rollDice2() {
    setState(() {
      currentDiceRoll2 = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: rollDice1,
              child: Image.asset(
                'assets/images/dice-$currentDiceRoll1.png',
                width: 200,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: rollDice2,
              child: Image.asset(
                'assets/images/dice-$currentDiceRoll2.png',
                width: 200,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: rollBothDice,
          child: const Text('Roll the Dice!'),
        ),
      ],
    );
  }
}