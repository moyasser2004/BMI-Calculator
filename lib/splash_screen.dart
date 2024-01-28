import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'bmi.dart';


class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  'BMI'
                  ,
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                const Text(
                  ' Calculator',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            OpenContainer(
              closedBuilder: (_, openContainer) {
                return Container(
                  height: 143,
                  width: 138,
                  child:  Container(
                    alignment: Alignment.topCenter,
                    child: Image(image: AssetImage("images/front.jpg"),fit: BoxFit.fill,),
                  ),
                );
              },
              openColor: Colors.black,
              closedElevation: 20,
              closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              transitionDuration: Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return SecondPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 1400), () {
      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3500), () {
      setState(() {
        _d = true;
      });
    });
    Timer(Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: ThirdPage(), page: CircularProgressIndicator(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.sizeOf(context).height;
    double _w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                  ? _h / 2
                  : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                      ? 2
                      : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h

                  : _c
                  ? 90
                  : 40,
              width: _d
                  ? _w
                  : _c
                  ? 200
                  : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius:
                  _d ? BorderRadius.only() : BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: _e
                      ? AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      FadeAnimatedText(
                        'Bmi Calculator',
                        duration: Duration(milliseconds: 1700),
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],

                  )
                      : SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: route,
        ),
  );
}

