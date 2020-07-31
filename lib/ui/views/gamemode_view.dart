import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/shared/main_button.dart';
import 'package:truthordare/ui/views/addplayer_view.dart';

class GameMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Game Mode',
                style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 2,
              ),
              MainButton(
                color: Colors.yellow,
                text: 'Kids',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPlayer()));
                  // TODO: Implement kids button
                },
              ),
              Spacer(),
              MainButton(
                color: Colors.deepOrange,
                text: 'Adults',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPlayer()));
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
