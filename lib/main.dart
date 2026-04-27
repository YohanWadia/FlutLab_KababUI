import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const ScaleTransitionExampleApp());
}

class ScaleTransitionExampleApp extends StatelessWidget {
  const ScaleTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.indigo,
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: ScaleTransitionExample());
  }
}

class ScaleTransitionExample extends StatefulWidget {
  const ScaleTransitionExample({super.key});

  @override
  State<ScaleTransitionExample> createState() => _ScaleTransitionExampleState();
}

class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );

  @override
  void initState() {
    super.initState();
    //_controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//=======================Variables
  String dropdownValue = 'Select Kababas';
  var kababasList = [
    'Select Kababas',
    'Regular',
    'Vilnius Kababas',
    'Wrap Style',
    'Burito Style',
    'Open Kababas'
  ];

  int selectedRadio = 0; //for meat

  List<bool> checked = [false, false, false, false]; //for extras

  List<bool> choice = [false, false, false, false]; // for padazai

  double sliderValue = 3; // for spicy

  bool isON = true; // eating or take away

  String status = "";
  String buzzer = "";
  String waitingTime = "";

//=======================Variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ScaleTransition(
              scale: _animation,
              child: SizedBox(
                  width: 200.0,
                  height: 80.0,
                  child: Image.asset("assets/logo.jpg")),
            ),
            //===============================

            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.pink[200]),
              child: DropdownButton(
                style: TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: Colors.pink[200],
                focusColor: Colors.pink[100],
                icon: Icon(Icons.arrow_downward),
                value: dropdownValue,
                items: kababasList.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  //how to disallow "Select Kababas" from being selected
                  setState(() {
                    if (newValue != "Select Kababas") {
                      dropdownValue = newValue!;
                      print("You have selected $dropdownValue");
                    }
                  });
                },
              ),
            ),
            //=============================

            SizedBox(
              height: 20,
            ),
            Text("Meat"),
            Row(children: [
              Expanded(
                child: ListTile(
                  title: Text("Chicken"),
                  leading: Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("RadioButton $val selected");
                      selectedRadio = val!;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("Pork"),
                  leading: Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("RadioButton $val selected");
                        selectedRadio = val!;
                        setState(() {});
                      }),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("Beef"),
                  leading: Radio(
                    value: 3,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("RadioButton $val selected");
                      selectedRadio = val!;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ]),
//==============================

            SizedBox(
              height: 20,
            ),
            Text("Extras"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    value: checked[0],
                    onChanged: (bool? value) {
                      setState(() {
                        checked[0] = value!;
                      });
                    },
                    title: const Text('Fries'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    value: checked[1],
                    onChanged: (bool? value) {
                      setState(() {
                        checked[1] = value!;
                      });
                    },
                    title: const Text('Drink'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    value: checked[2],
                    onChanged: (bool? value) {
                      setState(() {
                        checked[2] = value!;
                      });
                    },
                    title: const Text('Cookie'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    value: checked[3],
                    onChanged: (bool? value) {
                      setState(() {
                        checked[3] = value!;
                      });
                    },
                    title: const Text('KetchUp'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
            //=============================

            SizedBox(
              height: 20,
            ),
            Text("Padazai"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ChoiceChip(
                  label: Text('Garlic'),
                  selected: choice[0] == true,
                  onSelected: (bool selected) {
                    setState(() {
                      choice[0] = selected;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Teriyaki'),
                  selected: choice[1] == true,
                  onSelected: (bool selected) {
                    setState(() {
                      choice[1] = selected;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Krienai'),
                  selected: choice[2] == true,
                  onSelected: (bool selected) {
                    setState(() {
                      choice[2] = selected;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('CheeseMayo'),
                  selected: choice[3] == true,
                  onSelected: (bool selected) {
                    setState(() {
                      choice[3] = selected;
                    });
                  },
                ),
              ],
            ),
//==================================

            SizedBox(
              height: 20,
            ),
            Text("Spice"),
            Slider(
              value: sliderValue,
              max: 5,
              divisions: 5,
              label: sliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                  print(sliderValue);
                });
              },
            ),
//====================================

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Eat In'),

                Switch(
                  value: isON,
                  activeColor: Colors.red,
                  inactiveThumbColor: Colors.green,
                  onChanged: (bool value) {
                    setState(() {
                      isON = value;
                      print(isON);
                    });
                  },
                ),

                Text('Take Away') //add a bit more UI
              ],
            ),
            //=================================

            SizedBox(
              height: 20,
            ),
            Text(
              "$status $buzzer $waitingTime",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: placeMyOrder,
        tooltip: 'Place Order',
        child: const Icon(Icons.menu),
      ),
    );
  }

  void placeMyOrder() {
    String fullOrder = "You have selected $dropdownValue";

    String addMeat = "";
    if (selectedRadio == 1) {
      addMeat = "Chicken";
    } else if (selectedRadio == 2) {
      addMeat = "Beef";
    } else if (selectedRadio == 3) {
      addMeat = "Pork";
    }

    fullOrder = fullOrder + " with $addMeat.";

    String addExtras = "";
    //if(checked[0]==true){addExtras=" ";}
    //if(checked[1]==true){addExtras = addExtras + " ";}
    //if(checked[2]==true){addExtras = addExtras + " ";}
    //if(checked[3]==true){addExtras = addExtras + " ";}

    fullOrder = fullOrder + "\nExtras Selected: $addExtras";

    String addPadazas = "";
    //if(){addPadazas = " Garlic";}
    //if(){addPadazas = addPadazas + " Teriyaki";}
    //if(){addPadazas = addPadazas + " Krienai";}
    //if(){addPadazas = addPadazas + " CheeseMayo";}

    fullOrder = fullOrder + "\nSauce Selected: $addPadazas";

    fullOrder = fullOrder + "\nSpice Level: ";

    String eating = "";
    //if(){ eating = "Eating Inside";}
    //else{eating="Take Away";}

    fullOrder = fullOrder + "\n$eating";

    //====================
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Order'),
              content: Text(fullOrder),
              actions: <Widget>[
                //===========Cancelled
                TextButton(
                  onPressed: () {
                    status = "Order Cancelled. ";
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('Cancel'),
                ),

                //=================OK
                TextButton(
                  onPressed: () {
                    status = "Order Confirmed.";
                    Random rnd = Random();
                    //int number = rnd.nextInt(??);
                    //buzzer = "Please take buzzer# ???. ";

                    //number = rnd.nextInt(??);
                    waitingTime = "Ready in ?? mins.";

                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
