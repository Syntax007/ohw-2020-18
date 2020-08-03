import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/views/add_dares.dart';
import 'package:truthordare/ui/views/add_truth.dart';
import 'package:truthordare/ui/views/gamemode_view.dart';
import 'package:truthordare/ui/views/add_truth.dart';
import 'package:truthordare/ui/views/add_dares.dart';

import '../shared/main_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1440);
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150.sp,
              ),
              Text(
                'Dare To Click',
                style: TextStyle(fontFamily:'DancingScript',fontSize: 90.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                color: Colors.deepPurple[900],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(60.0,10.0,60.0,10.0),
                  child: Text('Play',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameMode(),
                    ),
                  );
                },
              ),
              Spacer(),
              FlatButton(
                color: Colors.blue[900],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  child: Text('Add Truths',
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
                  //
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTruth(),
                    ),
                  );
                },
              ),
              Spacer(),
              FlatButton(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(12.0,10.0,15.0,10.0),
                  child: Text('Add Dares',
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
                  // TODO: Implement Add dare button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDare(),
                    ),
                  );
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
