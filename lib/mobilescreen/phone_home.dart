
import 'package:cambridge_wealth/models/bottom_navigation_item_data.dart';
import 'package:cambridge_wealth/widgets/score.dart';
import 'package:flutter/material.dart';

import '../webpages/bottom_navigation_item.dart';
import '../widgets/home_page_row.dart';

class PhoneHome extends StatefulWidget {
  const PhoneHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PhoneHomeState();
}

class PhoneHomeState extends State<PhoneHome> {

  List<BottomNavigationItemData> actions = [BottomNavigationItemData(onClick: (){}, icon: Icons.home, name: 'Home', selected: true),BottomNavigationItemData(onClick: (){}, icon: Icons.settings, name: 'Settings', selected: false)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/homebg.png'),
                fit: BoxFit.fitWidth),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [
                0.45,
                0.9,
              ],
                  colors: [
                Colors.black,
                Colors.transparent
              ])),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      right: 24, left: 24, top: 40, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('assets/images/applogo.png'),
                                fit: BoxFit.cover,
                                scale: 0.1)),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24,right: 24,bottom: 16),
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

          bottomNavigationBar: Container(

            height: 80,

            decoration: BoxDecoration(

              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              color: Colors.grey[900]

            ),

            child: Row(
              
              children: actions.map((e){ return Expanded(child: BottomNavigationButton(bottomNavigationItemData: e));}).toList(),
              
            ),

          ),
        ),
      ],
    );
  }
}
