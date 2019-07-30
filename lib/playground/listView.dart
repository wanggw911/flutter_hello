
import 'dart:core';
import 'package:flutter/material.dart';

class DemoModel {
  String title;
  String subTitle;
  String location;
  bool isCollection;

  DemoModel(this.title, this.subTitle, this.location, this.isCollection);
}

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<DemoModel> dataSource = [
    DemoModel('John Doe', 'Lunch Invitation', '5m', false),
    DemoModel('Jane Doe', 'College fee structure', '5m', false),
    DemoModel('Delicious.ly', 'Order Confirmation', '5m', false),
    DemoModel('NewFoodForYou', 'New Recipe', '5m', false),
  ];

  void _collectionAction(int index) {
    setState(() {
      DemoModel model = dataSource[index];
      model.isCollection = !model.isCollection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Demo'),),
      body: Container(
        child: ListView.builder(
          itemCount: dataSource.length,
          //itemExtent: 100, //设置行高
          itemBuilder: (context, index){
            DemoModel model = dataSource[index];
            return Column(
              children: <Widget>[
                Row(  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            dataSource[index].title,
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            dataSource[index].subTitle,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            dataSource[index].location,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                _collectionAction(index);
                              },
                              child: Icon(
                                model.isCollection ? Icons.star : Icons.star_border,
                                size: 35.0,
                                color: model.isCollection ? Colors.yellow : Colors.grey,
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            );
          },
        ),
    ),
    );
  }
}