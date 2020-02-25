import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/animation.dart';
import 'package:fluttertest/user.dart';
import 'package:fluttertest/card.dart';
import 'package:fluttertest/main.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  List<User> listFavoriteUser = [];

  User userFavorite; 
   
  @override
  void initState() {
    super.initState();
    getListUser();
  }
  
  void getListUser() {
    
    sharedPrefService.getAllUsers().then((user) {
      setState(() {
        this.listFavoriteUser = user;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Favorite"),),
      backgroundColor: Colors.teal,
      body: (this.listFavoriteUser.length == 0) 
      ? Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,))
      : Center(
        child: Container(
          color: Colors.transparent,
          width: 300,
          height: 400,
          child: TinderSwapCards(
            orientation: AmassOrientation.BOTTOM,
              totalNum: this.listFavoriteUser.length,
              stackNum: 2,
              swipeEdge: 3.0,
              maxWidth: 450,
              maxHeight: 650,
              minWidth:  MediaQuery.of(context).size.width * 0.3,
              minHeight:  MediaQuery.of(context).size.width *0.3,
              cardBuilder: (context, index) {
                return CardInfomation(this.listFavoriteUser[index]);
              },
          )
        ),
      )
    );
  }
}

