import 'package:flutter/material.dart';
import 'package:Project/lib/data.dart';
class CartScreen extends StatefulWidget {
  

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

    _buildCartItem(Order order) {
      return Container(
        padding: EdgeInsets.all(20.0),
        height: 170.0,
        child: Row(
          children: <Widget> [
            Expanded(
             child: Row(children: <Widget>[
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                   image: DecorationImage(
                    image: AssetImage(
                      order.food.imageUrl,),
                      fit:BoxFit.cover,
                ),//DecorationImage
                borderRadius: BorderRadius.circular(15.0),
                ),//BoxDecoration
              ),//Container
             Expanded( 
              child:Container(
              margin: EdgeInsets.all(12.0),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.start,
                child: <Widget>[
                  Text(
                    order.food.name,
                    style: TextStyle(
                      fontSize:20, 
                      fontWeight:FontWeight.bold
                      ),//TextStyle
                      overflow: TextOverFlow.ellipsis,
                  ),//Text
                  SizedBox(height: 10.0,),//SizedBox
                  Text(
                    order.restaurant.name,
                    style: TextStyle(fontSize:16, fontWeight:FontWeight.w600),
                    overflow: TextOverFlow.ellipsis,
                  ),//Text
                  SizedBox(height: 10.0),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width:0.8, color:Colors.black54,
                    ),//Border.all
                    ),//Boxdecoration
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      GestureDetector( 
                        onTap: () {},
                      child:Text('-', style: TextStyle(color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      ),//TextStyle
                      ),//Text
                      ),//GestureDetector
                      SizedBox(width:20.0),
                      Text(order.quantity.toString(), 
                      style: TextStyle(
                        fontSize:20.0, 
                        fontWeight: FontWeight.w600,
                      ),//TextStyle 
                      ),//Text
                      GestureDetector(
                        ontap: () {},
                      child:Text('+', style: TextStyle(color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      ),//TextStyle)
                      ),//Text
                      ),//GestureDetector
                    ],//Widget
                    ),//Row
                  ),//Container
                ],//widget
                ),//Column
            ),//Container
             )//Expanded
            ],//Widget
            ), //Row
            ),//Expaned
            Container(
              margin: EdgeInsets.all(10.0),
            child:Text('\$${oder.quantity * order.food.price}', 
            style: TextStyle(
              fontSize:60.0, 
              fontWeight:FontWeight.w600
            ),//TextStyle
            ),//Text
            ),//Container
          ],//Widget 
        ),//Row
      );//Container 
    }

  @override
  Widget build(BuildContext context) {
    double totalPrice =0;
    currentUser.cart.forEach((Order order)=> totalPrice += order.quantity * order.food.price);
    return Scaffold(
      appbar: AppBar(title:Text('Cart (${currentUser.cart.length})'),
      ),//Appbar
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if(index < currentUser.cart.length){
          Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
          Column(children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Estimated Delivery Time:', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,
                ),//TextStyle
                ),//Text
                Text('25 min',  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,
                ),//TextStyle
                ),//Text
              ],//Widget
              ),//Row
              SizedBox(height:10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Total cost:', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,
                ),//TextStyle
                ),//Text
                Text('\$${totalPrice.toStringAsFixed(2)}',  
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 20.0, 
                  fontWeight: FontWeight.w600,
                ),//TextStyle
                ),//Text
              ],//Widget
              ),//Row
              SizedBox(height:80.0),
          ],//Widget
          ),//Column
          ),//Pading
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height:1.0, 
            color: Colors.grey,
            );//Divider
        },
      ), //Listview.separated
        bottomSheet: Container(
          height:100.0,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          decoration: Boxdecoration(
            boxShadow: [BoxShadow( 
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius:6.0,
              ),//boxshadow
              ],),//BoxDecoration
              child: Center(child: FlatButton(child: Text('CHECKOUT', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold, 
                letterSpacing: 2.0, 
                ),//TextStyle
                ),//Text
                onPressed: () {},
                ),//Flatbutton
                ),//Center
        ),//Container
    );//Scaffold
  }
}