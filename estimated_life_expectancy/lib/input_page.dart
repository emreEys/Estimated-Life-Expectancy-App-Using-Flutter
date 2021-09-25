import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Widgets/iconMaleFemale.dart';
import 'Widgets/my_Container.dart';
import 'constants.dart';
import 'result_page.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double smoke = 0.0;
  double sportDay = 0.0;
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'LIFE TIME',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButtom('HEIGHT'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButtom('WEIGHT'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'How many days a week do you exercise?',
                      style: kTextStyle,
                    ),
                    Text(
                      sportDay.round().toString(),
                      style: kNumberStyle,
                    ),
                    Slider(
                      divisions: 7,
                      min: 0,
                      max: 7,
                      value: sportDay,
                      onChanged: (double newValue) {
                        setState(() {
                          sportDay = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'how many cigarettes do you smoke a day?',
                      style: kTextStyle,
                    ),
                    Text(
                      smoke.round().toString(),
                      style: kNumberStyle,
                    ),
                    Slider(
                      min: 0,
                      max: 30,
                      value: smoke,
                      onChanged: (double newValue) {
                        setState(() {
                          smoke = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = "FEMALE";
                        });
                      },
                      color: selectedGender == "FEMALE"
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: IconCinsiyet(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = "MALE";
                        });
                      },
                      color: selectedGender == "MALE"
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: IconCinsiyet(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50.0,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              kilo: weight,
                              boy: height,
                              seciliCinsiyet: selectedGender,
                              yapilanSpor: sportDay,
                              icilenSigara: smoke))));
                },
                child: Text('CALCULATE', style: kTextStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowOutlineButtom(String label) {
    return Row(
      children: [
        const SizedBox(width: 20),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
          ),
        ),
        const SizedBox(width: 10),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'HEIGHT' ? height.toString() : weight.toString(),
            style: kNumberStyle,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.lightBlue, width: 2),
                ),
                onPressed: () {
                  setState(() {
                    label == 'HEIGHT' ? height++ : weight++;
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.plus,
                  size: 20.0,
                ),
              ),
            ),
            ButtonTheme(
              //buton size
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.lightBlue, width: 2),
                ),
                onPressed: () {
                  setState(() {
                    label == 'WEIGHT' ? weight-- : height--;
                  });
                },
                child: const Icon(
                  FontAwesomeIcons.minus,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
