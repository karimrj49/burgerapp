// ignore_for_file: prefer_const_constructors

import 'package:burgerapp/data/data.dart';
import 'package:burgerapp/models/restaurant.dart';
import 'package:burgerapp/widgets/recent_orders.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  _buildrestaurent() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          restaurant.address,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "0.2 miles a way",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: const Text('Food Delivery'),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              'cart ',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2.5),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: InputBorder.none,
                  hintText: 'search food or Restaurents',
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          const Recentorders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Nearby Restaurent",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      letterSpacing: 1.0),
                ),
              ),
              _buildrestaurent(),
            ],
          )
        ],
      ),
    );
  }
}
