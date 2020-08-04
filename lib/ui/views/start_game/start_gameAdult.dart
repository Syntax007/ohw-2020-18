import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionbrain.dart';
import 'dart:math';
import '../addplayer_adultView.dart' as APAdult;

// Creating an instance of the class TeenTruthBrain
AdultTruthBrain adultTruthBrain = AdultTruthBrain();
// Creating an instance of the class TeenDareBrain
AdultDareBrain adultDareBrain = AdultDareBrain();

class StartGameAdult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Random _random = Random();
    int _randomName = _random.nextInt(APAdult.players.length).toInt();
    print(_randomName);
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150.sp,
                    ),
                    Center(
                      child: Text(
                        'Truth or Dare',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Center(
                      //TODO: Show added player name here
                      child: Text(
                        APAdult.players[_randomName],
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute()),
                          );
                        },
                        color: Colors.lightBlueAccent,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Truth',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThirdRoute()),
                          );
                        },
                        color: Colors.blue[900],
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Dare',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
    When user clicks on Truth in Truth or Dare for Adult

    SecondRoute is activated
*/

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  // To check if the user completes the task
  void checkCompleted(bool userPickedAnswer) {
    bool correctAnswer = adultTruthBrain.getCorrectAnswer();

    setState(() {
      if (adultTruthBrain.isFinished() == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartGameAdult()));
        // Alert(
        //         context: context,
        //         title: "QUIZ FINISHED",
        //         desc: "Flutter is awesome.")
        //     .show();
        adultTruthBrain.reset();
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartGameAdult()));
      adultTruthBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Truth',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 9,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        adultTruthBrain.getQuestionText(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      checkCompleted(false);
                    },
                    color: Colors.lightBlueAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FORFEIT',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      checkCompleted(true);
                    },
                    color: Colors.blue[900],
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
    When user clicks on Dare in Truth or Dare for Adult.

    ThirdRoute is activated
*/
class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  void checkCompleted(bool userPickedAnswer) {
    bool correctAnswer = adultDareBrain.getCorrectAnswer();

    setState(() {
      if (adultDareBrain.isFinished() == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartGameAdult()));
        // Alert(
        //         context: context,
        //         title: "QUIZ FINISHED",
        //         desc: "Flutter is awesome.")
        //     .show();
        adultDareBrain.reset();
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartGameAdult()));
      adultDareBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/header.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Dare',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  height: 300,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 9,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        adultDareBrain.getQuestionText(),
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      checkCompleted(false);
                    },
                    color: Colors.lightBlueAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FORFEIT',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      checkCompleted(true);
                    },
                    color: Colors.blue[900],
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
