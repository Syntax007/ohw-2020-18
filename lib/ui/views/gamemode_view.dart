import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/shared/main_button.dart';
import 'package:truthordare/ui/views/addplayer_view.dart';
import 'package:truthordare/ui/views/addplayer_adultView.dart';

class GameMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150.sp,
              ),
              Text(
                'Game Mode',
                style: TextStyle(fontFamily:'DancingScript',fontSize: 90.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50.0,10.0,50.0,10.0),
                  child: Text('TEEN',
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
                      MaterialPageRoute(builder: (context) => AddPlayer()));
                  // TODO: Implement kids button
                },
              ),
              Spacer(),

              FlatButton(
                color: Colors.blue[900],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                  child: Text('ADULT',
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
                      MaterialPageRoute(builder: (context) => AddPlayerAdult()));
                  // TODO: Implement Adults button
                },
              ),

              Spacer(
                flex: 4,
              )
            ],
          )),
    );
  }
}
