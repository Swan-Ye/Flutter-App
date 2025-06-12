import 'package:flutter/material.dart';
import 'package:myapp/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            const Text("Sushi Man",
                style: TextStyle(color: Colors.white, fontSize: 25)),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(50.5),
              child: Image.asset('asset/tuna.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text("THE TASTE OF JAPANESE FOOD",
                style: TextStyle(color: Colors.white, fontSize: 44)),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
