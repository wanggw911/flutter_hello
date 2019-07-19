
import 'package:flutter/widgets.dart';

/* 自定义路由方法 */
class CutomRoute extends PageRouteBuilder {
  final Widget widget;
  CutomRoute(this.widget)
  : super(
    transitionDuration: const Duration(seconds: 1),
    pageBuilder:(BuildContext context, Animation<double> animation1, Animation<double> animation2) {
      return widget;
    },
    transitionsBuilder:(BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
      //1、渐变路由
      // return FadeTransition(
      //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //     parent: animation1, curve: Curves.fastOutSlowIn
      //   )),
      //   child: child,
      // );
      //2、缩放路由动画
      // return ScaleTransition(
      //   scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
      //     parent:animation1, curve: Curves.fastOutSlowIn
      //   )),
      //   child: child
      // );
      //3、旋转+缩放路由动画
      // return RotationTransition(
      //   turns: Tween(begin:0.0,end:1.0).animate(CurvedAnimation( 
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn
      //   )),
      //   child:ScaleTransition(scale:Tween(begin: 0.0,end:1.0)
      //     .animate(CurvedAnimation(
      //       parent: animation1,
      //       curve:Curves.fastOutSlowIn
      //     )),
      //     child: child,
      //   )
      // );
      //4、左右滑动路由动画
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0)
        )
        .animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );
    },
  );
}