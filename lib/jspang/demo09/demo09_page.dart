
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
          ClipPath(
            clipper: BottomCustomClipper(),
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

class BottomCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height-30);
    var path = Path()
                ..lineTo(0, 0)
                ..lineTo(0, size.height-30)
                ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
                ..lineTo(size.width, size.height-30)
                ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}