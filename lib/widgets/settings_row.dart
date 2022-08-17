import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget{

  final IconData icon;
  final String title;

  const SettingsRow({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(

          width: 96,
          height: 96,

          margin: const EdgeInsets.all(Spacing.space8),

          decoration: BoxDecoration(

            color: context.colorScheme.blackShade,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.3)),

          ),

          child: Icon(icon,color: Colors.white,size: 56,),

        ),

        Container( margin: const EdgeInsets.only(bottom: Spacing.space16),child: Text(title,style: context.textTheme.body1Medium,),),
      ],
    );

  }

}