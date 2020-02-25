import 'package:flutter/material.dart';
import 'package:fluttertest/card.dart';
import 'package:fluttertest/favorite_screen.dart';
import 'package:fluttertest/profile_service.dart';
import 'package:fluttertest/sharePref_service.dart';
import 'package:fluttertest/user.dart';

import 'animation.dart';


final SharedPrefService sharedPrefService = SharedPrefService();

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  ProfileService profileService = ProfileService();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  User user;
  List<User> listUser = [];

  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    getListUser();
  }
  
  void getListUser() {
    List<User> fetchUse = [];

    widget.profileService.getProfle().then((user){
      if(user != null) {
        fetchUse.add(user);
        print(user.name.first);
      } else {
        print("USER INFO NULL");
      }
    });

    widget.profileService.getProfle().then((user){
      if(user != null) {
        fetchUse.add(user);
        print(user.name.first);
        setState(() {
          this.isLoading = false;
          this.listUser = fetchUse;
        });
      } else {
        print("USER INFO NULL");
      }
    });

    setState(() {
      this.listUser = fetchUse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.favorite),),
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteScreen()));
      }),
      body: (this.listUser.length == 0 || this.isLoading) 
      ? Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,))
      : Center(
        child: Container(
          color: Colors.transparent,
          width: 300,
          height: 400,
          child: TinderSwapCards(
            orientation: AmassOrientation.BOTTOM,
              totalNum: this.listUser.length,
              stackNum: 2,
              swipeEdge: 2,
               maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 2.3,
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  minHeight: MediaQuery.of(context).size.width * 0.7,
              cardBuilder: (context, index) {
                return CardInfomation(this.listUser[index]);
              },
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                print(orientation.index);
                if(orientation.index == 0) { //left 
                    setState(() {
                      if(index == this.listUser.length - 1 )  {
                        this.isLoading = true;
                        this.getListUser();
                      }
                      
                    });
                } else if(orientation.index == 1) { // right
                  sharedPrefService.saveAllUser(this.listUser[index]);
                }
              },
          )
        ),
      )
    );
  }


}


// class FavoriteScreen extends StatefulWidget {
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   List<User> listFavoriteUser = [];

//   User userFavorite; 
   
//   @override
//   void initState() {
//     super.initState();
//     getListUser();
//   }
  
//   void getListUser() {
//     sharedPrefService.getAllUsers().then((user) {
//       // setState(() {
//       //   userFavorite = user;
//       // });
//       setState(() {
//         this.listFavoriteUser = user;
//       });
      
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("List Favorite"),),
//       backgroundColor: Colors.teal,
//       body: (this.listFavoriteUser.length == 0) 
//       ? Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,))
//       : Center(
//         child: Container(
//           color: Colors.transparent,
//           width: 300,
//           height: 400,
//           child: TinderSwapCards(
//             orientation: AmassOrientation.BOTTOM,
//               totalNum: this.listFavoriteUser.length,
//               stackNum: 2,
//               swipeEdge: 3.0,
//               maxWidth: 450,
//               maxHeight: 650,
//               minWidth:  MediaQuery.of(context).size.width * 0.3,
//               minHeight:  MediaQuery.of(context).size.width *0.3,
//               cardBuilder: (context, index) {
//                 return CardInfomation(this.listFavoriteUser[index]);
//               },
//           )
//         ),
//       )
//     );
//   }
// }

