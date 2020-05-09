import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static final String path = "lib/pages/landing_page.dart";
  @override
  _LandingPageState createState() => _LandingPageState();
}

const brightYellow = Color(0xFFFFD300);
const darkYellow = Color(0xFFFFB900);

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8c9eff),
      appBar: AppBar(
        backgroundColor: Color(0xFF536dfe),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              child: const Text(
                'Welcome',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: FlareActor(
              'assets/flare/cart_purple_moving.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'moving',
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Color(0xFF651fff),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Color(0xFF651fff),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
