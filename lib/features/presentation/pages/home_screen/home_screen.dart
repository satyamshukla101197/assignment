import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supdup/core/config/localization.dart';
import 'package:supdup/core/config/navigation.dart';
import 'package:supdup/core/utils/constants.dart';
import 'package:supdup/core/utils/custom_extension.dart';
import 'package:supdup/features/data/entities/entities.dart';

import 'home_screen_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomeScreen> {
  UserModelEntity? userModelEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
            listener: (context, state) {
              if (state is HomeScreenErrorState) {
                widget.showErrorToast(
                    context: context, message: state.message ?? "");
                //Kill Loader
                Navigation.back(context);
              } else if (state is HomeScreenLoadingState) {
                widget.showProgressDialog(context);
              } else if (state is HomeScreenLoadedState) {
                //Kill Loader
                Navigation.back(context);
                if (state.userModelEntity != null) {
                  userModelEntity=state.userModelEntity;
                }
              }
            },
            builder: (context, state) {
              if (state is HomeScreenInitial) {
                BlocProvider.of<HomeScreenBloc>(context).add(
                    HomeScreenListEvent());
              }
              return _getBody();
            }),






          //_getBody(),
        ));
  }

 Widget _getBody() {
    return Container(
      child: ListView.separated(
          separatorBuilder: (BuildContext context,int index){
            return Padding(padding: EdgeInsets.only(bottom: 10.0));
          },
          itemCount: userModelEntity!.userResult!.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  userModelEntity==null?Text("Name: "):Text("Name: "+userModelEntity!.userResult![index].name),
                  userModelEntity==null?Text("Email: "):Text("Email: "+userModelEntity!.userResult![index].email),
                  userModelEntity==null?Text("Phone number: "):Text("Phone number: "+userModelEntity!.userResult![index].phone)
                ],
              ),
            );
          },

          ),
    );
 }
}
