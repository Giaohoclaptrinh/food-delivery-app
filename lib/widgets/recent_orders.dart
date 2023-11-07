import 'package:flutter/material.dart';
import 'package:Project/lib/data/data.dart';
import 'package:Project/lib/models/order.dart';

class RecentOrders extends StatelessWidget {

  _buildRecentOrder(BuildContext context, Order order){
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0, 
          color: Color.grey[200],
        ),//Border.all
      ),//BoxDecoration
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expaned(
              child:Row(
                children: <Widget> [
        ClipRRect(
          borderRadius : BorderRadius.circular(15.0),
        child:Image(
          height: 100.0,
          width: 100.0,
          image: AssetImage(order.food.imageUrl),
          fit: BoxFit.cover,
            ),//image
          ),//ClipRRect
       Expened(
       child: Container(
          margin: EdgeInsets.all(12.0),
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              order.food.name, 
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),//TextStyle
              oveflow: TextOverflow.ellipsis,
            ),//Text
            SizedBox(height: 4.0),
            Text(
              order.restaurant.name, 
              style:TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
            ),//TextStyle
            oveflow: TextOverflow.ellipsis,
          ),//Text
          SizedBox(height: 4.0),
            Text(
              order.date, 
              style:TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
            ),//TextStyle
            oveflow: TextOverflow.ellipsis,
          ),//Text
        ], //<Widget>[]
        ), //Column
        ),//Container
       ),//Expaned
        ],//<Widget>[]
      ),//Row
      ),//Expened
        Container(margin: EdgeInsets.only(right: 20.0),
        width: 48.0,
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
      ],//<Widget>[]
      ), //Row
    );//Container
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children : <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal:20.0),
          child:Text
          ('Recent Orders', 
          style: TextStyle(
            fontSize: 24.0, 
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ), //TextStyle
        );//Text
        ),//Padding
        Container(height: 120.0,
           // color: Color.blue,
         child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: currentUser.orders.length,
          itemBuilder: (BuildContext context, int index) {
            Orders order = currentUser.orders[index];
            return _buildRecentOrder(context, order);
          },
        ),
        ),//Container
      ],//<Widget>[]
    );//Column
  }
}