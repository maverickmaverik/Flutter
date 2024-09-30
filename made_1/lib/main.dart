import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 255, 200),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75.0,
              backgroundImage: AssetImage('assets/images/Steven4x3.png'),
            ),
            const Text(
              'Steven Handoko',
              style: TextStyle(
                fontSize: 40.0,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.work,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Jakarta - Indonesia',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '0877-7695-0799',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'steven.handoko@binus.ac.id',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
