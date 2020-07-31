import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truthordare/ui/views/gamemode_view.dart';

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
                'Truth Or Dare',
                style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 2,
              ),
              MainButton(
                color: Colors.yellow,
                text: 'Play',
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
              MainButton(
                color: Colors.deepOrange,
                text: 'Add Truth',
                onPressed: () {
                  // TODO: Implement Add truth button
                },
              ),
              Spacer(),
              MainButton(
                color: Colors.blue[500],
                text: 'Add Dare',
                onPressed: () {
                  // TODO: Implement Add dare button
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
