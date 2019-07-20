
import 'package:flutter/material.dart';

class ClipPathDemo extends StatefulWidget {
  ClipPathDemo({Key key}) : super(key: key);

  _ClipPathDemoState createState() => _ClipPathDemoState();
}

class _ClipPathDemoState extends State<ClipPathDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('贝塞尔曲线切割')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("1、「圆弧形」贝塞尔曲线"),
          ),
          ClipPath(
            clipper: CustomNormalBesselClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("2、「波浪线」贝塞尔曲线"),
          ),
          ClipPath(
            clipper: CustomWaveBesselClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

//圆弧形 贝塞尔曲线
class CustomNormalBesselClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: 增加一个悬浮按钮来控制贝塞尔曲线的生成，更直观地感受贝塞尔曲线
    int value = 100;//修改这个值，来查看效果
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height-value);
    var path = Path()
                ..lineTo(0, 0)
                ..lineTo(0, size.height-value)
                ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
                ..lineTo(size.width, size.height-value)
                ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//圆弧形 贝塞尔曲线
class CustomWaveBesselClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    
    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.25, size.height-30);

    var secondControlPoint = Offset(size.width/4*3, size.height-80);
    var secondEndPoint = Offset(size.width, size.height-40);

    var path = Path()
                ..lineTo(0, size.height-20)
                ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
                ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
                ..lineTo(size.width, size.height-40)
                ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}