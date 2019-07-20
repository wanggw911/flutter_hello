
import 'package:flutter/material.dart';

class WarpLayoutDemo extends StatefulWidget {
  WarpLayoutDemo({Key key}) : super(key: key);

  _WarpLayoutDemoState createState() => _WarpLayoutDemoState();
}

class _WarpLayoutDemoState extends State<WarpLayoutDemo> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()
            ..add(buildAddButton());  
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: (){
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1,  buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //得到屏幕的宽高，用来设置Container的宽高
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
       appBar: AppBar(
         title: Text('照片流式布局'),
       ),
       body: Center(
         child: Opacity(
           opacity: 0.8,
           child: Container(
             width: widht,
             height: height/2,
             color: Colors.grey,
             child: Wrap(
               children: list,
               spacing: 26.0, //设置间距，然后元素自动适配宽高
             ),
           ),
         ),
       ),
    );
  }
}

