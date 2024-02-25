import 'package:flutter/material.dart';
import 'package:sls/top.dart';
import 'top.dart';
import 'bottom.dart';
import 'package:confetti/confetti.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: Duration(seconds: 15));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.black, // Set background color to black
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank you for your contribution!',
                    style: TextStyle(
                      fontFamily: 'Gabriela-Regular',
                      fontSize: 24,
                      color: Color(0xFFB99A45), // Set text color to B99A45
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your generosity will make a difference.',
                    style: TextStyle(
                      fontFamily: 'Gabriela-Regular',
                      fontSize: 18,
                      color: Color(0xFFB99A45), // Set text color to B99A45
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controller,
                blastDirection: -3.14 / 2, // Blast from top
                emissionFrequency: 0.05, // Emission frequency
                numberOfParticles: 10, // Number of particles
                gravity: 0.2, // Gravity
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
