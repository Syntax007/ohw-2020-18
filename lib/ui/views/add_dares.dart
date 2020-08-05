import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/views/start_game/question.dart';
import './start_game/questionbrain.dart' as qb;
import '../shared/main_button.dart';

class AddDare extends StatefulWidget {
  final bool isTeen;

  const AddDare({Key key, this.isTeen}) : super(key: key);
  @override
  _AddDareState createState() => _AddDareState();
}

class _AddDareState extends State<AddDare> {
  // List<String> dares = [];
  final controller = TextEditingController();

  // List<String> addTo(List<String> list, String item){
  //   list.add(item);
  //   return list;
  // }

  String dare;
  List<Question> _teenDareBank = qb.TeenDareBrain().getTeenDareBank;
  List<Question> _adultDareBank = qb.AdultDareBrain().getAdultDareBank;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 1440, width: 720);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 35),
                Text(
                  'Add Dares',
                  style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 90.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
                SizedBox(height: 45),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: TextField(
                        controller: controller,
                        onChanged: (val) {
                          setState(() {
                            dare = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter your question here',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 4.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.0),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 54,
                          child: RaisedButton(
                            onPressed: () {
                              if (dare != null && dare.trim().isNotEmpty) {
                                if (widget.isTeen &&
                                    !_teenDareBank.contains(dare)) {
                                  setState(() {
                                    qb.teenDareBank.add(Question(dare, true));
                                  });
                                } else if (!widget.isTeen &&
                                    !_adultDareBank.contains(dare)) {
                                  setState(() {
                                    qb.adultDareBank.add(Question(dare, true));
                                  });
                                }
                              }
                              controller.clear();
                              dare = null;
                              print(dare);
                            },
                            child: Text(
                              'ADD Dare',
                              style: TextStyle(
                                fontFamily: 'NanumMyeongjo',
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.lightBlueAccent,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: BorderSide(color: Colors.black, width: 3),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 18),
                Container(
                  // height: 250,
                  // width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFFCCCCCC),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: widget.isTeen
                      ? _teenDareBank.length <= 10
                          ? Center(
                              child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 100, 10, 100),
                              child: Text(
                                'No Questions Added yet',
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    color: Color(0xFF6A6A6A)),
                              ),
                            ))
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 18, 8, 18),
                              child: ListView(
                                children: <Widget>[
                                  for (int i = 10;
                                      i < _teenDareBank.length;
                                      i++)
                                    ListTile(
                                      title:
                                          Text(_teenDareBank[i].questionText),
                                      trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          setState(() {
                                            qb.teenDareBank.removeAt(i);
                                          });
                                        },
                                      ),
                                    )
                                ],
                              ),
                            )
                      : _adultDareBank.length <= 10
                          ? Center(
                              child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 100, 10, 100),
                              child: Text(
                                'No Questions Added yet',
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    color: Color(0xFF6A6A6A)),
                              ),
                            ))
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 18, 8, 18),
                              child: Column(
                                children: <Widget>[
                                  for (int i = 10;
                                      i < _adultDareBank.length;
                                      i++)
                                    ListTile(
                                      title:
                                          Text(_adultDareBank[i].questionText),
                                      trailing: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          setState(() {
                                            qb.adultDareBank.removeAt(i);
                                          });
                                        },
                                      ),
                                    )
                                ],
                              ),
                            ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  color: Colors.deepPurple[900],
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
