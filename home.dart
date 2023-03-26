import 'package:flutter/material.dart';
import 'componenets.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(userInput.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w900))),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(answer.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w900)))
              ],
            )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'C',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '*/-',
                            onPress: () {
                              userInput += '*/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: Colors.orange,
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: Colors.orange,
                            onPress: () {
                              userInput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            setState(() {
                              userInput += '4';
                            });
                          },
                        ),
                        MyButton(
                            title: '5',
                            onPress: () {
                              setState(() {
                                userInput += '5';
                              });
                            }),
                        MyButton(
                            title: '6',
                            onPress: () {
                              setState(() {
                                userInput += '6';
                              });
                            }),
                        MyButton(
                            title: '-',
                            color: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += '-';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                        ),
                        MyButton(
                            title: '2',
                            onPress: () {
                              setState(() {
                                userInput += '2';
                              });
                            }),
                        MyButton(
                            title: '3',
                            onPress: () {
                              setState(() {
                                userInput += '3';
                              });
                            }),
                        MyButton(
                            title: '+',
                            color: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += '+';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                        ),
                        MyButton(
                            title: '.',
                            onPress: () {
                              setState(() {
                                userInput += '.';
                              });
                            }),
                        MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            color: Colors.orange,
                            onPress: () {
                              evaluator();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void evaluator() {
    String val = userInput;
    val = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(val);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
