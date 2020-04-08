import 'package:flutter/material.dart';
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
  final List<String> dataList = ["FirstPage","SecondPage","ThirdPage","SecondPage","FirstPage","SecondPage","FirstPage","SecondPage"];

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
            //返回列表项
            return ListTile(
              title:new Text(dataList[index],textAlign: TextAlign.center),
              //点击跳转至商品详情页 传入Product对象
              onTap: () {
                gotoOther(context, dataList[index]
                );
              },
            );
          }),
    );
  }
}
