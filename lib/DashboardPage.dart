// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipes_app/FoodTab.dart';
import 'package:recipes_app/BurgerPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu, color: Colors.black),
              Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 3.0))
                      ],
                      color: Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/tuxedo.png'),
                          fit: BoxFit.contain)))
            ],
          )),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'SEARCH FOR FOOD',
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w800,
              fontSize: 27.0),
        ),
      ),
      SizedBox(height: 25.0),
      Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontFamily: 'NotoSans', fontSize: 14.0),
                border: InputBorder.none,
                fillColor: Colors.grey.withOpacity(0.5),
                prefixIcon: Icon(Icons.search, color: Colors.grey)),
          ),
        ),
      ),
      SizedBox(height: 20.0),
      Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('Recommended',
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ))),
      SizedBox(height: 15.0),
      SizedBox(
          height: 200.0,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            buildListItem('Hamburg', 'assets/burger.png', '21',
                Color(0xffffe9c6), Color(0xffda9551)),
            buildListItem('Chips', 'assets/fries.png', '15', Color(0xffc2e3fe),
                Color(0xff6abcaa)),
            buildListItem('Donuts', 'assets/doughnut.png', '15',
                Color(0xffd7fada), Color(0xff56cc7e)),
          ])),
      SizedBox(height: 15.0),
      Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
              unselectedLabelStyle: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED'))
              ])),
      SizedBox(
          height: MediaQuery.of(context).size.height - 450.0,
          child: TabBarView(
              controller: tabController,
              children: [FoodTab(), FoodTab(), FoodTab(), FoodTab()]))
    ]));
  }

  buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BurgerPage(
                      heroTag: foodName,
                      foodName: foodName,
                      pricePerItem: price,
                      imgPath: imgPath)));
            },
            child: Container(
                height: 175.0,
                width: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: bgColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: foodName,
                        child: Container(
                            height: 75.0,
                            width: 75.0,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(imgPath,
                                    height: 50.0, width: 50)))),
                    SizedBox(height: 25.0),
                    Text(foodName,
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 17.0,
                            color: textColor)),
                    Text('\$$price',
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 17.0,
                            color: textColor))
                  ],
                ))));
  }
}
