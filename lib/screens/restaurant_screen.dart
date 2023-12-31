import 'package:flutter/material.dart';)
import 'package:Project/lib/models/restaurant.dart';
import 'package:Project/lib/models/food.dart'
class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  State RestaurantScreen> createState() =>  RestaurantScreenState();
}

class  RestaurantScreenState extends State RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage(menuItem.imageUrl),//AssetImage
            fit: BoxFit.cover,
          ),//DecorationImage
          borderRadius :BorderRadius.circular(15.0),
          ),//BoxDecoration
        ),//Container
        Container(
          height: 175.0, 
          width:  175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              stops:[ 0.1,0.5,0.7,0.9], 
            ),//LinearGradient
          ),//BoxDecoration
        ),//Container
        Positioned(
          bottom: 65.0,
        child:Column(children: <Widget>[
          Text(menuItem.name, style: TextStyle(
            color: Colors.white, 
            fontSize: 24.0, 
            fontWeight: FontWeight.bold, 
            letterSpacing:1.2,
          ),//TextStyle
          ),//Text
          Text('\$${menuItem.price}', style: TextStyle(
            color: Colors.white, 
            fontSize: 18.0, 
            fontWeight: FontWeight.bold, 
            letterSpacing:1.2,
          ),//TextStyle
          ),//Text
        ],//Widget
        ),//Column
      ),//Positioned
      Positioned(
        bottom: 10.0, 
        right:10.0,
        child:  Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ), //BoxDecoration
        child: IconButton(icon: Icon(Icons.add),
        iconSize:30.0,
        color: Color.white,
        onlPressed: () {},
        ),//IconButton
        ),//Container
      ),//Positioned
      ],//Widget
      ),//Stack
    );//center
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(children: <Widget>[
          Hero(
            tag: widget.restaurant.imageUrl,
            child:Image(
            height: 220.0,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(widget.restaurant.imageUrl),
            fit:BoxFit.cover,
          ),//image
          ),//hero
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () => Navigator.pop(context),
            ),//iconbutton
            IconButton(icon: Icon(Icons.favorite),
            color: Theme.of(context).primaryColor,
            iconSize: 30.0,
            onPressed: () [],
            ),//iconbutton
            ],//widget
          ), //Row
          ),//Padding
          
        ],//widget
        ), //stack
        Padding(
          padding: EdgeInsets.all(20.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(widget.restaurant.name, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600,
                ),//TextStyle
                ),//Text
                Text('0.2 mile away',style : TextStyle(fontSize:18.0,
                ),//TextStyle
                ),//Text
              ],//Widget
              ),//Row
              RatingStars(widget.restaurant.rating),
              SizedBox(height: 6.0),
              Text(widget.restaurant.address,
              style: TextStyle(fontSize: 18.0),
              ),//Text
            ],//Widget
          ),//Column
        ),//Padding
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(padding: EdgeInsets.symmetric(horizontal: 30.0,),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
            ), // RoundedRectangleBorder
            child: Text('Review', style: TextStyle(color: Colors.white, fontSize: 20.0,
            ),//TextStyle
            ), //Text
            onPressed: () {},
            ), //flatbutton 
            FlatButton(padding: EdgeInsets.symmetric(horizontal: 30.0,),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
            ), // RoundedRectangleBorder
            child: Text('Contact', style: TextStyle(color: Colors.white, fontSize: 20.0,
            ),//TextStyle
            ), //Text
            onPressed: () {},
            ), //flatbutton 
          ],//Widget
        ),//Row
        SizedBox(height: 10.0),
        Center(
          child: Text('Menu', style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,,
          ),//TextStyle
          ),//Text
        ),//Center
        SizedBox(height:10.0),
        Expended(
            child:GridView.count(
              padding: EdgeInsets.all(10.0), 
          crossAxisCount: 2,
          children: List.generate(widget.restaurant.menu.length, (index) {
            Food food = widget.restaurant.menu[index];
            return _buildMenuItem(food);
            
          }),//List.generate
        )//Gridview.count
        ),//Expended
      ],), //widget Column
    );//Scaffold
  }
} 