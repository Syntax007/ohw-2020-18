import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/main_button.dart';

class AddDare extends StatefulWidget {
  @override
  _AddDareState createState() => _AddDareState();
}

class _AddDareState extends State<AddDare> {
  List<String> dares = [];
  final controller = TextEditingController();

  List<String> addTo(List<String> list, String item){
    list.add(item);
    return list;
  }

  String dare;
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
                SizedBox(height: 25),
                Text(
                  'Add Dares',
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, letterSpacing: 3),
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
                            )
                            ),

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
                              if(dare.trim().isNotEmpty && !dares.contains(dare)){
                                setState(() {
                                  dares = addTo(dares, dare);
                                });
                              }
                              controller.clear();
                              print(dares);
                            },
                            child: Text('ADD Dare'),
                            color: Colors.white,
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
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: dares.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
                              child: Text(
                              'No Questions Added yet',
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  color: Color(0xFF6A6A6A)),
                          ),
                            ))
                        : Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 18, 8, 18),
                          child: Column(
                              children: <Widget>[
                                for(String i in dares)
                                ListTile(title: Text(i))
                              ],
                            ),
                        )),
                SizedBox(height:20),
                MainButton(
                  text: 'BACK', 
                  textColor: Color(0xFFE9E5FF), 
                  color: Color(0xFF0000FE), 
                  onPressed: (){
                    Navigator.pop(context);
                  },)

              ],
            ),
          ),
        ),
      ),
    );
  }
}