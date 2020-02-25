
import 'package:flutter/material.dart';
import 'package:fluttertest/user.dart';

class FilterButtonModel {
  String title;
  String descreption;
  IconData icon;
  bool isSelected;

  FilterButtonModel({this.title, this.descreption, this.icon, this.isSelected = false});
}

class CardInfomation extends StatefulWidget {

  CardInfomation(this.user);

  final User user;

  @override
  _CardInfomationState createState() => _CardInfomationState();
}

class _CardInfomationState extends State<CardInfomation> {
  List<FilterButtonModel> listFilter = [];



  int indexSelected = 0;

  @override
  void initState() {
    super.initState();

    this.listFilter.add(FilterButtonModel(
      icon: Icons.person,
      title: "My name is", 
      descreption: "${this.widget.user.name.first} ${this.widget.user.name.last}",
      isSelected: true
    ));

    this.listFilter.add(FilterButtonModel(
      icon: Icons.calendar_today,
      title: "My email is", 
      descreption: "${this.widget.user.email}"
    ));

    this.listFilter.add(FilterButtonModel(
      icon: Icons.map,
      title: "My address is", 
      descreption: "${this.widget.user.location.street.name}"
    ));

    this.listFilter.add(FilterButtonModel(
      icon: Icons.phone,
      title: "My phone numbers is", 
      descreption: "${this.widget.user.phone}"
    ));

    this.listFilter.add(FilterButtonModel(
      icon: Icons.lock,
      title: "My age is", 
      descreption: "${this.widget.user.dob.age}"
    ));

    
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 300,
        height: 400,
        padding: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildInfomationDetail()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAvatar(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Color.fromARGB(255, 200, 200, 200))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150/2),
        child: Container(
          child: Image.network(this.widget.user.picture.large, fit: BoxFit.fill)
        ),
      ),
    );
  }

  Widget _buildInfomationDetail() {
    return Container(
      width: 300,
      height: 250,
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(),
          _buildStringDescription(),
          _buildListFilter()
        ],
      ),
    );
  }

  Widget _buildStringDescription(){
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(this.listFilter[indexSelected].title,
              style: TextStyle(
                color: Color.fromARGB(255, 170, 170, 170),
                fontSize: 18
              ),
            ),
            SizedBox(height: 5,),
            Text(this.listFilter[indexSelected].descreption,
              style: TextStyle(
                color: Color.fromARGB(255, 74, 74, 74),
                fontSize: 25
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildListFilter() {
    return Container(
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 50),
        scrollDirection: Axis.horizontal,
        itemCount: this.listFilter.length,
        itemBuilder: (_, index) {
          return Material(
            child: InkWell(
              onTap: (){
                setState(() {
                  for(int i = 0; i< this.listFilter.length; i++) {
                    if(i == index) {
                      this.listFilter[i].isSelected = true;
                    } else {
                      this.listFilter[i].isSelected = false;
                    }
                  }
                  this.indexSelected = index;
                });
              },
              child: _buildFilterButton(icon: this.listFilter[index].icon, isSelected: this.listFilter[index].isSelected),
            ),
          );
      }),
    );
  }

  Widget _buildFilterButton({IconData icon, bool isSelected}) {
    return Container(
      width: 40,
      height: 60,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          (isSelected) ? _buildPoiter() : SizedBox(),
          Icon(icon,
            color: (isSelected) ? Colors.green : Colors.grey,
            size: 35,)
        ],
      ),
    );
  }

  Widget _buildPoiter() {
    return Container(
      width: 40,
      height: 2,
      color: Colors.green,
    );
  }
}