import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/shared/main_button.dart';
import 'package:truthordare/ui/views/start_game/start_game.dart';

  List<String> players = [];

class AddPlayer extends StatefulWidget {
  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _name;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 1440, width: 720);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100.sp),
            Text(
              'Add Player',
              style: TextStyle(
                fontFamily:'DancingScript',
                fontSize: 90.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() => _name = val);
                        },
                        validator: (val) => players.contains(val)
                            ? 'Player already exists'
                            : null,
                        controller: _textEditingController,
                        expands: false,
                        textCapitalization: TextCapitalization.words,
                        // style: TextStyle(fontSize: 50.sp),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 4.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3.0),
                          ),
                          errorStyle: TextStyle(color: Colors.yellow),
                          hintText: 'Enter player name',
                          filled: true,
                          fillColor: Colors.white,
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
                            if (_formKey.currentState.validate() &&
                                _name.trim().isNotEmpty) {
                              setState(() => players.add(_name));
                              _textEditingController.clear();
                            }
                          },
                          child: Text('Add Player'),
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: BorderSide(color: Colors.black, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                    decoration: BoxDecoration(
                        color: Color(0xFFCCCCCC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 10),
                      child: ListTile(
                        title: Text(players[index]),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            // color: Colors.yellow,
                          ),
                          onPressed: () {
                            setState(() => players.remove(players[index]));
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Spacer(),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                color: Colors.deepPurple[900],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50.0,10.0,50.0,10.0),
                  child: Text('START',
                    style: TextStyle(
                      fontFamily: 'NanumMyeongjo',
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  if (players.isNotEmpty){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartGame()));
                  }
                  // TODO: Implement kids button
                },
              ),
            ),
            SizedBox(
              height: 50.sp,
            )
          ],
        ),
      ),
    );
  }
}
