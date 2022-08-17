import 'package:cambridge_wealth/models/notification_data.dart';
import 'package:cambridge_wealth/webpages/side_navigation_item.dart';
import 'package:cambridge_wealth/widgets/SideNavigationBar.dart';
import 'package:cambridge_wealth/widgets/notification_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bottom_navigation_item_data.dart';
import '../widgets/home_page_row.dart';
import '../widgets/notification_row.dart';
import '../widgets/score.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebHomeState();
}

class WebHomeState extends State<WebHome> {

  final borderSide = BorderSide(color: Colors.white.withOpacity(0.3), width: 1);
  


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width : MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/webbg.png'),
                fit: BoxFit.fill),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(

            children: [

              const SideNavigationBar(),

              Container(

                margin: const EdgeInsets.only(bottom: 0,left: 40,right: 40,top: 56),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text('HOME > DETAILS', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.white),),

                    Expanded(

                      child: Container(

                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(8).copyWith(left: 0),

                        width: MediaQuery.of(context).size.width * 0.5,

                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.8),
                          //borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                          border: Border(
                            left: borderSide,
                            right: borderSide,
                            top: borderSide,
                          )
                        ),

                        child: RawScrollbar(
                          isAlwaysShown: true,
                          thumbColor: Colors.grey[800],
                          radius: const Radius.circular(8),
                          thickness: 4,

                          child: SingleChildScrollView(
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left:  32, top: 40, bottom: 30),
                                  child: const Text('TITLE', style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.amber),
                                      ),
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(top: 12),
                                                child: Row(
                                                  children: [
                                                    const Score(value: '14,552', title: 'SCORE'),
                                                    Container(
                                                      width: 1,
                                                      height: 56,
                                                      color: Colors.white,
                                                    ),
                                                    const Score(value: '10,552', title: 'CREDIT'),
                                                    Container(
                                                      width: 1,
                                                      height: 56,
                                                      color: Colors.white,
                                                    ),
                                                    const Score(value: '1,552', title: 'COINS'),
                                                    Container(
                                                      width: 1,
                                                      height: 56,
                                                      color: Colors.white,
                                                    ),
                                                    const Score(value: '2,552', title: 'MONEY'),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 16, top: 12, bottom: 12),
                                                child: const Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat.',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return HomePageRow(
                                        description: 'Lorem ipsum dolor',
                                        rating: (index + 1).toString(),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),

                      ),
                    ),

                  ],

                ),
              ),

              NotificationSection(),

            ],

          ),
        ),
      ],
    );
  }
}
