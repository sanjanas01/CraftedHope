import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sls/wrapper.dart';
import 'login.dart';
import 'about.dart';
import 'donate.dart';
import 'dform.dart';
import 'Shop.dart';
import 'recycle.dart';
import 'rform.dart';
import 'thrift.dart';
import 'sell.dart';
import 'buy.dart';
import 'logout.dart';
import 'pwd.dart';
import 'mydetails.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CraftedHope',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => SplashScreen(),
         '/about_us': (context) => AboutUsPage(),
        '/Donate': (context) => Donate(),
        '/dform': (context) => dform(),
        '/shop': (context) => shop(),
        '/recycle': (context) => rec(),
        '/rform': (context) => rform(),
        '/thrift': (context) => ThriftPage(),
        '/logout': (context) => LogoutPage(),
        '/myaccount': (context) => MyDetailsPage(),
        '/login': (context) => LoginPage(),
      },
      home: Wrapper(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login page after a delay
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Adjust the path as per your asset location
          height: 200, // Adjust the height as needed
        ),
      ),
    );
  }
}
