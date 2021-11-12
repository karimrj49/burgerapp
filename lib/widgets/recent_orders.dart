import 'package:burgerapp/data/data.dart';
import 'package:burgerapp/models/order.dart';
import 'package:flutter/material.dart';

class Recentorders extends StatelessWidget {
  const Recentorders({Key? key}) : super(key: key);

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          )),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 100.0,
              width: 100.0,
              image: AssetImage(order.food.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                order.food.name,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                order.restaurant.name,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Text(
                order.date,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              }),
        )
      ],
    );
  }
}
