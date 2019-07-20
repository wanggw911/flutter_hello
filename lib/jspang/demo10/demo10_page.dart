
import 'package:flutter/material.dart';

class SplashScreenDemo extends StatefulWidget {
  SplashScreenDemo({Key key}) : super(key: key);

  _SplashScreenDemoState createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  // FIXME：下面的方法都没有走。。不知道为啥
  @override
  void initState() { 
    super.initState();
    //既然有竖直的，应该就有横向的
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);  
    /**
     * 动画事件监听器，
     * 它可以监听到动画的执行状态，
     * 我们在这里只监听动画是否结束，
     * 如果技术则执行页面跳转动画 */  
     _animation.addStatusListener((status) {
       if (status == AnimationStatus.completed) {
         Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SplashScreenHomePage()), 
          (router) => router==null);
       }

       //播放动画
       _controller.forward();
       print('播放动画');
     });
  }

  @override
  void dispose() {
    _controller.dispose();
    print('动画完成');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
        opacity: _animation, //执行动画
        child: Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
          scale: 2.0,        //进行缩放
          fit: BoxFit.cover, //充满父容器
          ),
      );
  }
}

class SplashScreenHomePage extends StatelessWidget {
  const SplashScreenHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: Center(child: Text("我是首页"),),
    );
  }
}