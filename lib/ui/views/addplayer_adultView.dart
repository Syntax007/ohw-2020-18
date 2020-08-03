import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/shared/main_button.dart';
import 'package:truthordare/ui/views/start_game/start_gameAdult.dart';

class AddPlayerAdult extends StatefulWidget {
  @override
  _AddPlayerAdultState createState() => _AddPlayerAdultState();
}

class _AddPlayerAdultState extends State<AddPlayerAdult> {
  TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _name;
  List<String> _players = [];

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() => _name = val);
                        },
                        validator: (val) => val.isEmpty
                            ? 'Oops, you didn\'t enter a name'
                            : _players.contains(val)
                            ? 'Player already exists'
                            : null,
                        controller: _textEditingController,
                        expands: false,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(fontSize: 50.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 40.sp, horizontal: 16.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          errorStyle: TextStyle(color: Colors.yellow),
                          hintText: 'Enter player name',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.person_add,
                          size: 80.sp,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() => _players.add(_name));
                            _textEditingController.clear();
                          }
                        }, //TODO: Implement Add Player button
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _players.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue,
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          setState(() => _players.remove(_players[index]));
                        }, //TODO: Implement Delete Player button
                      ),
                      title: Text(
                        _players[index],
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w500,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartGameAdult()));
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
