
import 'package:flutter/material.dart';

class ExpandStateBean {
  var index;
  var isOpen;
  ExpandStateBean(this.index, this.isOpen);
}

class ExpansionListDemo extends StatefulWidget {
  ExpansionListDemo({Key key}) : super(key: key);

  _ExpansionListDemoState createState() => _ExpansionListDemoState();
}

class _ExpansionListDemoState extends State<ExpansionListDemo> {
  var currentPanelIndex = -1;
  List<int> mList; //组成一个int类型数组，用来控制索引
  List<ExpandStateBean> expandStateList;//展开的状态列表
  
  //构造方法，调用这个类的时候自动执行
  _ExpansionListDemoState() {
    mList = new List();
    expandStateList = new List();
    //便利为两个List进行赋值
    for (int i=0; i<10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      //遍历可展开的状态列表
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('展开闭合列表')),
       body: SingleChildScrollView(
         child: ExpansionPanelList(
           //交互回调属性，里面是一个匿名函数
           expansionCallback: (index, bol) {
             _setCurrentIndex(index, bol);
           },
           children: mList.map((index) { //进行map操作，然后用toList再次组成List
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('This is NO. $index'),
                  );
                },
                body: ListTile(
                  title: Text('expansion no. $index'),
                ),
                isExpanded: expandStateList[index].isOpen
              );
           }).toList(),
         ),
       ),
    );
  }
}