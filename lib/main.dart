import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';  
import 'Cart/cart_provider.dart';
import 'Account/login.dart';
import 'Home/about.dart';
import 'donate/donate.dart';
import 'donate/dform.dart';
import 'Shop.dart';
import 'Recycle/recycle.dart';
import 'Recycle/rform.dart';
import 'Thrift/thrift.dart';
import 'Account/logout.dart';
import 'Account/pwd.dart';
import 'Account/mydetails.dart';
import 'Cart/cart.dart';
import 'Cart/cart_provider.dart';
import 'chat.dart';
import '../Account/landing.dart';


void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CraftedHope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => SplashScreen(),
        '/about_us': (context) => AboutUsPage(),
        '/Donate': (context) => Donate(),
        '/dform': (context) => DonationForm(),
        '/shop': (context) => Shop(),
        '/recycle': (context) => rec(),
        '/rform': (context) => rform(),
        '/thrift': (context) => ThriftPage(),
        '/logout': (context) => LogoutPage(),
        '/myaccount': (context) => MyDetailsPage(),
        '/login': (context) => LoginPage(),
        '/cart': (context) => CartPage(),
        '/thrift': (context) => ThriftPage(),
        '/landing':(context) => LandingPage(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/landing');
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Path to your logo image
        ),
      ),
    );
  }
}