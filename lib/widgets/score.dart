import 'package:flutter/material.dart';

class Score extends StatelessWidget{
  
  final String value;
  final String title;
  
  const Score({Key? key,required this.value,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(

              margin: const EdgeInsets.only(bottom: 8),

              child: Text(value,style: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),

            ),

            Text(title,style: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),

          ],

        ),
      ),
    );

  }
  
  
}