import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebHome extends StatefulWidget{
  const WebHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebHomeState();

}

class WebHomeState extends State<WebHome>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Column(

          children: const [

            Text('Web'),

          ],

        ),

      ),

    );

  }

}