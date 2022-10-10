import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/Widget/box.dart';

import '../Boxdetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Widget> list = [];
  int index = 0;
  late List<Box_detail> bl  = Box_detail.Box_List();
  var myController = TextEditingController();
   bool status = true;
   void toggle(Box_detail b){
    setState((){
      b.status = !b.status;
    });
   }
   void delete (String name){
      setState((){
          bl.removeWhere((item) => item.id==name);
      });
   }
   void addbox(){
    setState((){ bl.add(Box_detail(id: '${DateTime.now()}', Text: myController.text)); myController.clear();});
   }

  Widget layout1() {
    return Column(
      children: [for ( var i in bl)
            Box(bl: i,toggle: toggle,delete: delete)
        ],
    );
  }


  Widget layout2(){
    return Container(
      padding:  EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top:BorderSide.none)
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(width: 1.0 ,color: Colors.grey)
              ),
              child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    label: Text('Enter New ToDo'),
                  )),
            ),
          ),
          SizedBox(width: 8.0,),
          InkWell(onTap: (){addbox();},child: Text('ADD',style: TextStyle(color: Colors.purple),))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.check_box),
            SizedBox(
              width: 8,
            ),
            Text('My ToDo')
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [Container(
                color: Colors.grey[100],
                child: layout1(),
              ),
            ]
            ),
          ),
          layout2(),
        ],
      ),
    );
  }
}
