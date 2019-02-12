import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Page extends StatelessWidget {

  final String title;

  Page(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Details'), backgroundColor: Colors.lightBlue,),
      backgroundColor: Colors.lightBlue[200],
      body: StreamBuilder(
        stream: Firestore.instance.collection('NutriData').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return FirestoreListView(documents: snapshot.data.documents, crop: '${title}');
        },
      ),
    );
  }
}

class FirestoreListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final String crop;

  FirestoreListView({this.documents, this.crop});

  // final header = DecoratedBox(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.fill,
  //           image: AssetImage('assets/'+plant+'.jpg')
  //         )
  //       )
  //     );

  

  @override
  Widget build(BuildContext context) {
        final plant = capitalize(crop);
        print(plant);
        String title = documents[0].data['${crop}'].toString();
        print('${documents[0].data}');
        return Column(
        children:<Widget> [  
            Card(
              elevation: 10.0,
              color: Colors.lightBlue,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      crop,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 8.0,
                      )
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    //child: header,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/'+plant+'.jpg')
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.0),
            Card(
              color: Colors.lightBlue,
              child: DataTable(
                
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nutrient',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900]
                    ),
                  )
                ),
                DataColumn(
                  label: Text(
                    'Amount\nRequired',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900]
                    ),
                  )
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      rowDataIcon(Icons.arrow_right, 'Calcium'),
                      onTap: null,
                    ),
                    DataCell(
                      rowDataIcon(Icons.arrow_right, documents[0].data[plant]['Calcium'].toString()+" Gm/Sq-ft"),
                    ),
                  ]
                ),
                DataRow(
                    cells: <DataCell>[
                      DataCell(
                        rowDataIcon(Icons.arrow_left, 'Nitrogen')
                      ),
                    DataCell(
                      rowDataIcon(Icons.arrow_right, documents[0].data[plant]['Nitrogen'].toString()+" Gm/Sq-ft")
                    ),
                  ]
                ),
                DataRow(
                    cells: <DataCell>[
                      DataCell(
                        rowDataIcon(Icons.arrow_left, 'Phosphorus')
                      ),
                    DataCell(
                      rowDataIcon(Icons.arrow_right, documents[0].data[plant]['Phosphorus'].toString()+" Gm/Sq-ft")
                    ),
                  ]
                ),
                DataRow(
                    cells: <DataCell>[
                      DataCell(
                        rowDataIcon(Icons.arrow_left, 'Potassium')
                      ),
                    DataCell(
                      rowDataIcon(Icons.arrow_right, documents[0].data[plant]['Potassium'].toString()+" Gm/Sq-ft")
                    ),
                  ]
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      rowDataIcon(Icons.arrow_left, 'Sulphur')
                    ),
                    DataCell(
                      rowDataIcon(Icons.arrow_right, documents[0].data[plant]['Sulphur'].toString()+" Gm/Sq-ft")
                    ),
                  ]
                ),
              ],
            ),
            ),
          ]
        );
  }
}


ListTile rowDataIcon(IconData iconVal, String rowName) {
  return ListTile(
    title: Text(
      rowName,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
    ),
  );
}
String capitalize(String s) => s[0] + s.substring(1).toLowerCase();