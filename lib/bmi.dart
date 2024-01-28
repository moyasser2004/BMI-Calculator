import 'dart:math';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => thirdPageState();
}

class thirdPageState extends State<ThirdPage> {

  double _value = 60.0;
  int age = 12;
  int weight = 50;
  bool isFemale = true;
  String? result2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 700
        ? 700
        : MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(fontSize: 23),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height / 1.18,
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                 highlightColor: Colors.black,
                                  onTap: () {
                                    setState(() {
                                      isFemale = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[900],
                                        borderRadius: BorderRadius.circular(20)),
                                    child:

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.male,
                                          size: height / 12,
                                          color: !isFemale
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                        SizedBox(
                                          height: height / 40,
                                        ),
                                        Text(
                                          "MALE",
                                          style: TextStyle(
                                            fontSize: height / 40,
                                            color: !isFemale
                                                ? Colors.blue
                                                : Colors.white,
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: InkWell(
                                  highlightColor: Colors.black,
                                  onTap: () {
                                    setState(() {
                                      isFemale = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[900],
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.female,
                                          size: height / 12,
                                          color: isFemale
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                        SizedBox(
                                          height: height / 40,
                                        ),
                                        Text(
                                          "FEMALE",
                                          style: TextStyle(
                                              fontSize: height / 40,
                                              color: isFemale
                                                  ? Colors.blue
                                                  : Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.only(top: height / 60),
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "HEIGHT",
                                style: TextStyle(
                                  fontSize: height / 50,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: height / 60),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${_value.round()}",
                                      style: TextStyle(
                                          fontSize: height / 27,
                                          color: Colors.white),
                                    ),
                                    const Text(
                                      " cm",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              Slider(
                                value: _value,
                                onChanged: (vale) {
                                  setState(() {
                                    _value = vale;
                                  });
                                },
                                min: 0.0,
                                max: 220,
                                mouseCursor: MouseCursor.uncontrolled,
                                thumbColor: Colors.red[900],
                                activeColor: Colors.white,
                                inactiveColor: Colors.grey[800],
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "AGE",
                                        style: TextStyle(
                                            fontSize: height / 45,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "$age",
                                        style: TextStyle(
                                            fontSize: height / 26,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: height / 50,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                age++;
                                              });
                                            },
                                            mini: true,
                                            splashColor: Colors.blue[900],
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.add,
                                              size: height / 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                age--;
                                              });
                                            },
                                            mini: true,
                                            splashColor: Colors.red[900],
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: height / 30,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "WEIGHT",
                                        style: TextStyle(
                                            fontSize: height / 45,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "$weight",
                                        style: TextStyle(
                                            fontSize: height / 26,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: height / 60,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                            mini: true,
                                            splashColor: Colors.blue[900],
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.add,
                                              size: height / 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                            mini: true,
                                            splashColor: Colors.red[900],
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: height / 30,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () {
                        var result = weight / pow(-_value.round() / 100, 2);
                        if (result < 18.5) {
                          result2 = "Under Weight";
                        } else if (result > 18.5 && result < 24.9) {
                          result2 = "Healthy Weight";
                        } else {
                          result2 = "Upper Range";
                        }
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent.withOpacity(.3),
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(.9),
                                    borderRadius: BorderRadius.circular(50)),
                                height: height / 3.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      isFemale ? "FEMALE" : "MALE",
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 25),
                                    ),
                                    Text(
                                      "Age: $age",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Height: ${_value.round()}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Weight: $weight",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      " result: ${result.round()}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Cases: $result2",
                                      style: TextStyle(
                                          color: Colors.red[900], fontSize: 22),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          backgroundColor: Colors.red[900],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "CALCULATE",
                            style: TextStyle(
                                fontSize: width /20, color: Colors.white),
                          ),
                          Container(
                            height: 3,
                            width: width / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
