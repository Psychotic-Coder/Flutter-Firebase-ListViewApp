import 'package:flutter/material.dart';
import './page.dart';
import './list_item.dart';

class DataList extends StatelessWidget {
  final Crop crop;

  DataList(this.crop);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 8.0,
    );

    Widget _textValue({String value, String image}) {
      return new Row(
        children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
        ]
      );
    }


    final cardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Center(
        child: 
          new Text(crop.name, style: headerTextStyle),
      ),
    );


    final card = new InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page(crop.name)));
      },
      child: new Container(
        child: cardContent,
        height: 104.0,
        margin: new EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
      )
    );


    return new Container(
      height: 120.0,
      child: new Stack(
        children: <Widget>[
          card,
        ],
      )
    );
  }
}