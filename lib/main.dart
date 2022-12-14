import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatapp/chat_feature/helper.dart';
import 'package:chatapp/chat_feature/search.dart';
import 'package:chatapp/home_screen.dart';
import 'package:chatapp/profile_screen.dart';
import 'package:chatapp/reset_password.dart';
import 'package:chatapp/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharePreference().then((value) {
      setState(() {
        userIsLoggedIn = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            splash: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: Image(
                    image: AssetImage('assets/Group 13.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'CHAT',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff131040)),
                      ),
                    ),
                    Container(
                      child: Text(
                        'IFY',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff131040)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                ),
              ],
            )),
            splashIconSize: 250,
            backgroundColor: Color(0xffFFB2A9),
            nextScreen: userIsLoggedIn != null
                ? userIsLoggedIn
                    ? HomeScreen()
                    : SignInScreen()
                : Container(
                    color: Colors.black12,
                  )));
  }
}
