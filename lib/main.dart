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
        debugShowCheckedModeBanner: false,
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

  bool isTakeAway = true; // eating or take away

  String status = "";
  String buzzer = "";
  String waitingTime = "";

//=======================Variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY KABAB"), //===THIS IS YOUR TITLE
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              showCredits();
            },
          ),
        ],
      ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //===============================
            //
            //
            //

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
                      print("You have selected ");
                    }
                  });
                },
              ),
            ),
            //=============================
            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //

            Text("Meat"),
            SizedBox(
              width: 150,
              child: ListTile(
                title: Text("Chicken"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("RadioButton  selected");
                    selectedRadio = val!;
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ListTile(
                title: Text("Pork"),
                leading: Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("RadioButton  selected");
                      selectedRadio = val!;
                      setState(() {});
                    }),
              ),
            ),
            SizedBox(
              width: 150,
              child: ListTile(
                title: Text("Beef"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("RadioButton  selected");
                    selectedRadio = val!;
                    setState(() {});
                  },
                ),
              ),
            ),
            //==============================
            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //

            Text("Extras"),
            SizedBox(
              width: 150,
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
            SizedBox(
              width: 150,
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
            SizedBox(
              width: 150,
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
            SizedBox(
              width: 150,
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
            //=============================
            //
            //
            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //
            //
            //

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
            //
            //
            ////
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //
            //

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
            //
            //
            ////
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Eat In'),

                Switch(
                  value: isTakeAway,
                  activeColor: Colors.red,
                  inactiveThumbColor: Colors.green,
                  onChanged: (bool value) {
                    setState(() {
                      isTakeAway = value;
                      print(isTakeAway);
                    });
                  },
                ),

                Text('Take Away') //add a bit more UI
              ],
            ),
            //=================================
            //
            //
            //
            //

            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.amber,
              ),
            ),
            //
            //
            //
            Text(
              "  ",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(
              height: 100,
            )
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

  //
  //
  //
  //
  //PLACE ORDER=====================

  void placeMyOrder() {
    String fullOrder = "You have selected ";

    String addMeat = "";
    if (selectedRadio == 1) {
      addMeat = "Chicken";
    } else if (selectedRadio == 2) {
      addMeat = "Beef";
    } else if (selectedRadio == 3) {
      addMeat = "Pork";
    }

    fullOrder = fullOrder + " with .";

    String addExtras = "";
    //if(checked[0]==true){addExtras=" ";}
    //if(checked[1]==true){addExtras = addExtras + " ";}
    //if(checked[2]==true){addExtras = addExtras + " ";}
    //if(checked[3]==true){addExtras = addExtras + " ";}

    fullOrder = fullOrder + "\nExtras Selected: ";

    String addPadazas = "";
    //if(){addPadazas = " Garlic";}
    //if(){addPadazas = addPadazas + " Teriyaki";}
    //if(){addPadazas = addPadazas + " Krienai";}
    //if(){addPadazas = addPadazas + " CheeseMayo";}

    fullOrder = fullOrder + "\nSauce Selected: ";

    fullOrder = fullOrder + "\nSpice Level: ";

    String eating = "";
    //if(){ eating = "Eating Inside";}
    //else{eating="Take Away";}

    fullOrder = fullOrder + "\n";

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

//popup dialog for your credits
  void showCredits() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('KMM Coding Club'),
        content: const Text(
          '''Order GUI v1.0

This project was designed & coded by the Junior IT class.
CREDITS: 
Jonas Medelis(5th Grade) and Vilius(7th Grade)''',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context), // Just close the dialog
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
