import 'package:flutter/material.dart';
import './list.dart';
import './list_item.dart';

class HomePage extends StatefulWidget {
  HomePage();
  static String tag = 'home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final tab1 = new DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/logo.jpg')
        )
      )
    );
    return new Scaffold(
      appBar: new AppBar(title: new Text('Nutri Plant'), backgroundColor: Colors.blueAccent,),
       backgroundColor: Color(0xFF736AB7),
      body: Column(
        children:<Widget> [
            Card(
            elevation: 10.0,
            color: Colors.lightBlueAccent,
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: tab1,
                ),
            ),
          ),
          Card(
            color: Color(0xFF333366),
            child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('Plant Nutrition Database',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
          ),
          Expanded(
            child: new Container(
              color: new Color(0xFF736AB7),
              child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  new SliverPadding(
                    //padding: const EdgeInsets.symmetric(vertical: 0.0),
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    sliver: new SliverFixedExtentList(
                      itemExtent: 90.0,
                      delegate: new SliverChildBuilderDelegate(
                          (context, index) => new DataList(crop[index]),
                        childCount: crop.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}