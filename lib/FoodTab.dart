// ignore: file_names
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
            buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
            buildListItem('Cheese Pizza', 5.0, '12', 'assets/pizza.png'),
            buildListItem('Popcorn', 4.0, '6', 'assets/popcorn.png')
    ]));
  }

  buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xffffe3df)),
                  child: Center(
                      child: Image.asset(imgPath, height: 50.0, width: 50.0))),
              SizedBox(width: 2.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodName,
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400)
                          ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xffffd143),
                      borderColor: Color(0xffffd143),
                      size: 15.0,
                      spacing: 0.0
                    ),
                    Row(children: <Widget>[
                      Text('\$$price',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfff6807f)
                      )
                      ),
                      SizedBox(width: 3.0),
                      Text('\$' '18',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12.0,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.withOpacity(0.4)
                      )
                      )
                    ])
                  ]
                ),
                FloatingActionButton(
                  onPressed: () {},
                  heroTag: foodName,
                  mini: true,
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white)
                  ),
                  backgroundColor: Color(0xfffe7d6a),
                )
            ]));
  }
}