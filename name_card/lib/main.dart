import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
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
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                'Electrical Engineer',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                'Jakarta - Indonesia',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(
                height: 1.0,
                child: Divider(
                  color: Color.fromARGB(0, 0, 0, 0),
                ),
              ),
              Container(
                width: 500.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const SocialMediaButton.whatsapp(
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse('https://wa.me/6287776950799'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const Text(
                        '0877-7695-0799',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 500.0,
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
                    SocialMediaButton.google(
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
              Container(
                width: 500.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const SocialMediaButton.linkedin(
                      url: 'https://www.linkedin.com/in/stevendhanyhandoko007',
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse(
                            'https://www.linkedin.com/in/stevendhanyhandoko007'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const Text(
                        'LinkedIn | Steven Handoko',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 500.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const SocialMediaButton.github(
                      url: 'https://github.com/maverickmaverik',
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse('https://github.com/maverickmaverik'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const Text(
                        'GitHub | MaverickMaverik',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
