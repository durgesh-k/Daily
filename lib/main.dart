import 'package:News_App/internet.dart';
import 'package:connectivity/connectivity.dart';
import 'package:News_App/splashscreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

final bool debugShowCheckedModeBanner = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Application',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}

class Homie extends StatefulWidget {
  @override
  _HomieState createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  ConnectivityResult previous;
  @override
  void initState() {
    super.initState();
    try {
      InternetAddress.lookup('google.com').then((result) {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Imageui(),
          ));
        } else {
          _showdialog();
        }
      }).catchError((error) {
        _showdialog();
      });
    } on SocketException catch (_) {
      // no internet
      _showdialog();
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connresult) {
      if (connresult == ConnectivityResult.none) {
      } else if (previous == ConnectivityResult.none) {
        // internet conn
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Imageui(),
        ));
      }

      previous = connresult;
    });
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Text("\n\nNo Internet Detected",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 17,
                fontFamily: 'PoppinsBold',
                color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            color: Colors.black,
            // method to exit application programitacally
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text("Exit",
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Poppins', color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Checking Your Internet Connection."),
            ),
          ],
        ),
      ),
    );
  }
}
