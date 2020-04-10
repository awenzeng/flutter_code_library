import 'package:flutter/material.dart';
import 'package:fluttercodelibrary/FlaxLayout.dart';
import 'package:fluttercodelibrary/MyHomePage.dart';
import 'package:fluttercodelibrary/animation/ChartsAnimation.dart';
import 'package:fluttercodelibrary/animation/MaskAnimation.dart';

import 'animation/ValueAnimation.dart';

void main() {
  runApp(MaterialApp(
    title: 'FlutterCodeLibrary',
    //商品列表
    home: MainList(),
  ));
}

//商品列表页
class MainList extends StatelessWidget {
  final List<String> dataList = ["FirstPage","SecondPage","ThirdPage","FouthPage","FlaxLayout","SecondPage","FirstPage","SecondPage"];

  void gotoOther(BuildContext context,String tag){
    switch(tag){
      case "FirstPage":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChartsAnimation()));
        break;
      case "SecondPage":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ValueAnimation()));
        break;
      case "ThirdPage":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MaskAnimation()));
        break;
      case "FouthPage":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyHomePage()));
        break;
      case "FlaxLayout":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  FlaxLayout()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterCodeLibrary"),
      ),
      //商品列表
      body: ListView.builder(
        //列表长度
          itemCount: dataList.length,
          //列表项构造器
          itemBuilder: (context, index) {

            final item = dataList[index];
            return new Dismissible(key: new Key(item),
                onDismissed: (direction){
                 dataList.removeAt(index);
                 Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$item 被删除了 ")));
                },
                child: ListTile(
                  title:new Text(dataList[index],textAlign: TextAlign.center),
                  //点击跳转至商品详情页 传入Product对象
                  onTap: () {
                    gotoOther(context, dataList[index]
                    );
                  },
                ));
          }),
    );
  }
}
