import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'costant.dart';
import 'bottombutton.dart';
import 'round_icon_button.dart';
import 'calculate_bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleActiveColor = kInactiveColor;
  Color femaleActiveColor = kInactiveColor;
  int height = 180;
  int weight = 18;
  int age = 34;

  void update(int gender) {
    if (gender == 1) {
      if (maleActiveColor == kInactiveColor) {
        maleActiveColor = kActiveColor;
        femaleActiveColor = kInactiveColor;
      } else {
        maleActiveColor = kInactiveColor;
        femaleActiveColor = kActiveColor;
      }
    } else {
      if (femaleActiveColor == kInactiveColor) {
        femaleActiveColor = kActiveColor;
        maleActiveColor = kInactiveColor;
      } else {
        femaleActiveColor = kInactiveColor;
        maleActiveColor = kActiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    update(1);
                  });
                },
                child: ReusableCard(
                  col: maleActiveColor,
                  cardChild: IconContent(FontAwesomeIcons.mars, 'MALE'),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    update(2);
                  });
                },
                child: ReusableCard(
                  col: femaleActiveColor,
                  cardChild: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
            col: kActiveColor,
            cardChild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'HEIGHT ',
                style: kLabelTextStyle,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: knumberTextStyle),
                    Text('cm', style: kLabelTextStyle),
                  ]),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFFBDBE98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
                child: Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (double newvalue) {
                    setState(() {
                      height = newvalue.round();
                    });
                  },
                ),
              )
            ]),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  col: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: knumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(
                                () {
                                  weight--;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
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
                )),
                Expanded(
                  child: ReusableCard(
                    col: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: knumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Button(
            bottomTitle: 'CALCULATE',
            onTap: () {


              CalculatorBrain calc = CalculatorBrain(height: 
              height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(resultBmi: calc.result(),Mess1: calc.getMess1(),Mess2:calc.getMess2());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


