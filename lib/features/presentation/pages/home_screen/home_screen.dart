import 'package:flutter/material.dart';
import 'package:supdup/core/config/localization.dart';
import 'package:supdup/core/utils/constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: _getBody(),
        ));
  }

 Widget _getBody() {
    return Container(
      child: ListView.separated(
          separatorBuilder: (BuildContext context,int index){
            return Padding(padding: EdgeInsets.only(bottom: 10.0));
          },
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child:  Column(
                children: <Widget>[
                  Text("Name"),
                  Text("Email"),
                  Text("Phone number")
                ],
              ),
            );
          },

          ),
    );
 }
}
