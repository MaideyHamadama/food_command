import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;

  BurgerPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  BurgerPageState createState() => BurgerPageState();
}

class BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.black),
                  Stack(children: [
                    Container(
                        height: 45.0, width: 45.0, color: Colors.transparent),
                    Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color(0xfffe7d6a).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(.0, 4.0))
                        ], color: Color(0xfffe7d6a), shape: BoxShape.circle),
                        child: Center(
                            child: Icon(Icons.shopping_cart,
                                color: Colors.white))),
                    Positioned(
                        top: 1.0,
                        right: 4.0,
                        child: Container(
                            height: 12.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Text('2',
                                    style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 7.0,
                                        color: Colors.red)))))
                  ])
                ])),
        Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(widget.foodName.toString().toUpperCase(),
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w800,
                    fontSize: 27.0))),
        SizedBox(height: 14.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Hero(
              tag: widget.heroTag,
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imgPath),
                          fit: BoxFit.cover)))),
          SizedBox(width: 15.0),
          Column(children: [
            Stack(children: [
              Container(
                  height: 45.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffe7d6a).withOpacity(0.1),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                            offset: Offset(5.0, 11.0))
                      ])),
              Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white),
                  child: Center(
                      child: Icon(
                    Icons.favorite_border,
                    color: Color(0xfffe7d6a),
                    size: 25.0,
                  )))
            ]),
            SizedBox(height: 35.0),
            Stack(children: [
              Container(
                  height: 45.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffe7d6a).withOpacity(0.1),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                            offset: Offset(5.0, 11.0))
                      ])),
              Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white),
                  child: Center(
                      child: Icon(
                    Icons.restore,
                    color: Color(0xfffe7d6a),
                    size: 25.0,
                  )))
            ])
          ])
        ]),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text('\$${int.parse(widget.pricePerItem) * quantity}',
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 40.0,
                          color: Color(0xff5e6166),
                          fontWeight: FontWeight.w500)),
                )),
            Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                    color: Color(0xfffe7d6a),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 40.0,
                          width: 113.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  iconSize: 17.0,
                                  icon: Icon(Icons.remove,
                                      color: Color(0xfffe7d6a)),
                                  onPressed: () {
                                    adjustQuantity('MINUS');
                                  },
                                ),
                                Text(quantity.toString(),
                                    style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 14.0,
                                        color: Color(0xfffe7d6a),
                                        fontWeight: FontWeight.w400)),
                                IconButton(
                                  iconSize: 17.0,
                                  icon:
                                      Icon(Icons.add, color: Color(0xfffe7d6a)),
                                  onPressed: () {
                                    adjustQuantity('PLUS');
                                  },
                                ),
                              ])),
                      Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 15.0,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w400))
                    ]))
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('FEATURED',
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700))),
        SizedBox(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: [buildListItem('1'),buildListItem('2')]))
      ]),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;

      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }

  buildListItem(String columnNumber) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          if (columnNumber == '1')
            builColumnItem(
                'assets/cheese.png', 'Sweet Cheese', '11', Color(0xfffbd6f5)),
          if (columnNumber == '1')
          SizedBox(height: 15),
          if (columnNumber == '1')
            builColumnItem(
                'assets/popcorn.png', 'Sweet Popcorn', '11', Color(0xfffbd6f5)),
          if (columnNumber == '2')
            builColumnItem(
                'assets/taco.png', 'Tacos', '6', Color(0xffc2e3fe)),
          if (columnNumber == '2')
          SizedBox(height: 15),
          if (columnNumber == '2')
            builColumnItem(
                'assets/sandwich.png', 'Sandwich', '11', Color(0xffd7fada)),
        ]));
  }
}

builColumnItem(String imgPath, String foodName, String price, Color bgColor) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    SizedBox(
        width: 210.0,
        child: Row(children: [
          Container(
              height: 75.0,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: bgColor),
              child:
                  Center(child: Image.asset(imgPath, height: 50, width: 50))),
          SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(foodName,
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400)),
            Text('\$$price',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xfff6bd7f)))
          ])
        ]))
  ]);
}
