import 'package:flutter/material.dart';

import '../Nav-bars/top.dart';
import '../Nav-bars/bottom.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 0.0),
              Container(
                height: 250.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/dress1.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/dress2.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/dress3.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/dress4.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset('assets/dress5.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: 'Gabriela-Regular',
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Welcome to CraftedHope, your go-to destination for sustainable fashion and responsible consumerism. We are passionate about fostering a community that values style, environmental consciousness, and the spirit of giving. Our platform offers a unique blend of opportunities for individuals to engage in a fashion ecosystem that goes beyond trends.',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(pageBackgroundColor: Colors.black,currentIndex: 0),
    );
  }
}
