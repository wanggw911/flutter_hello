import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class Device {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static double stateBarHeight = 0;
  static double bottomHeight = 0;

  static void getDeviceInfo(BuildContext context) {
    /*
    8Plus:
      flutter: 屏幕的宽高：414.0, 736.0
      flutter: 状态栏的宽高：20.0
      flutter: 底部栏的宽高：0.0

    XR：
      flutter: 屏幕的宽高：414.0, 896.0
      flutter: 状态栏的宽高：44.0
      flutter: 底部栏的宽高：34.0
     */

    //也就是可以获取到屏幕的逻辑像素，而不需去关心
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    print("屏幕的宽高：$screenWidth, $screenHeight");

    // XR：flutter: 状态栏的宽高：44.0
    stateBarHeight = MediaQuery.of(context).padding.top;
    print("状态栏的宽高：$stateBarHeight");

    // XR：flutter: 底部栏的宽高：34.0
    bottomHeight = MediaQuery.of(context).padding.bottom;
    print("底部栏的宽高：$bottomHeight");

  }

  
}