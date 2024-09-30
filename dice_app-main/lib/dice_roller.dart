// import 'dart:math';
// import 'package:flutter/material.dart';

// final randomizer = Random();

// class DiceRoller extends StatefulWidget {
//   const DiceRoller({super.key});

//   @override
//   State<DiceRoller> createState() {
//     return _DiceRollerState();
//   }
// }

// class _DiceRollerState extends State<DiceRoller> {
//   var currentDiceRoll = 2;

//   void rollDice() {
//     setState(() {
//       currentDiceRoll = randomizer.nextInt(6) + 1;
//     });
//   }

//   @override
//   Widget build(context) {
//     return Center(
//       child: TextButton(
//         onPressed: rollDice,
//         child: Image.asset(
//           'assets/images/dice-$currentDiceRoll.png',
//           width: 200,
//         ),
//       ),
//     );
//   }
// }

// Auto Random Dice Roller
// import 'dart:math';
// import 'dart:async';
// import 'package:flutter/material.dart';

// final randomizer = Random();

// class DiceRoller extends StatefulWidget {
//   const DiceRoller({Key? key}) : super(key: key);

//   @override
//   State<DiceRoller> createState() => _DiceRollerState();
// }

// class _DiceRollerState extends State<DiceRoller> {
//   var currentDiceRoll = 2;
//   Timer? _timer;
//   bool isRolling = false;

//   @override
//   void initState() {
//     super.initState();
//     startRolling();
//   }

//   void startRolling() {
//     setState(() {
//       isRolling = true;
//     });
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       setState(() {
//         currentDiceRoll = randomizer.nextInt(6) + 1;
//       });
//     });
//     print('Rolling started. isRolling: $isRolling');
//   }

//   void stopRolling() {
//     _timer?.cancel();
//     setState(() {
//       isRolling = false;
//     });
//     print('Rolling stopped. isRolling: $isRolling');
//   }

//   void toggleRolling() {
//     if (isRolling) {
//       stopRolling();
//     } else {
//       startRolling();
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: toggleRolling,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/dice-$currentDiceRoll.png',
//               width: 200,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               isRolling ? 'Click to Stop' : 'Click to Start',
//               style: const TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }