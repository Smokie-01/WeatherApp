import 'package:bmicalci/calulator_brain.dart';
import 'package:bmicalci/screens/result_Page.dart';
import 'package:flutter/material.dart';
import '../components/Icon_content.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../components/Bottom_button.dart';
import '../components/Roundicon_button.dart';

enum Gendertype { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gendertype gender = Gendertype.male;
  int height = 180;
  int age = 20;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarBackgroundColor,
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gendertype.male;
                      });
                    },
                    cardChild: IconContent(
                        gender: 'MALE ', iconData: FontAwesomeIcons.mars),

                    // this is a ternary opertor [gender == Gendertype.male  ? activeCardColor  : widgetcolors]

                    colour: gender == Gendertype.male
                        ? activeCardColor
                        : widgetcolors),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gendertype.female;
                      });
                    },
                    cardChild: IconContent(
                      gender: 'FEMALE',
                      iconData: FontAwesomeIcons.venus,
                    ),
                    colour: gender == Gendertype.female
                        ? activeCardColor
                        : widgetcolors),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: genderTXTstyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbertxtStyl,
                      ),
                      Text(
                        'cm',
                        style: genderTXTstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 8,
                      thumbColor: kSliderThumbColor,
                      overlayColor: kSliderOverLayColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      activeColor: kSliderActiveColor,
                      inactiveColor: kSliderInActiveColor,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                      min: 100,
                      max: 230,
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widgetcolors,
                borderRadius: BorderRadius.circular(9),
              ),
              height: 230,
              width: double.infinity,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: genderTXTstyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumbertxtStyl,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ])
                    ],
                  ),
                  colour: widgetcolors,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: genderTXTstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumbertxtStyl,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.remove,
                            onPress: () {
                              setState(
                                () {
                                  weight--;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPress: () {
                              setState(
                                () {
                                  weight++;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: widgetcolors,
                ),
              ),
            ],
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onPress: (() {
              CalulatoBrain calci = CalulatoBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ResultPage(
                        bmiResults: calci.calculationBMi(),
                        resultTxt: calci.getResult(),
                        advice: calci.getAdvice(),
                      )),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
