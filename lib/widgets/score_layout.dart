import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:cambridge_wealth/widgets/score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';
import 'home_page_row.dart';

class ScoreLayout extends StatelessWidget{

  final HomePageData homePageData;

  const ScoreLayout({Key? key, required this.homePageData}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Container(
          margin: const EdgeInsets.only(
              left: Spacing.space24,
              right: Spacing.space24,
              bottom: Spacing.space16),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height:
                context.displayHeight * 0.15,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    color: context.colorScheme
                        .primaryColor),
              ),
              Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: Spacing.space12),
                        child: Row(
                          children: [
                            Score(
                                value: homePageData.values[0],
                                title: homePageData.titles[0]),
                            Container(
                              width: 1,
                              height: 56,
                              color: Colors.white,
                            ),
                            Score(
                                value: homePageData.values[1],
                                title: homePageData.titles[1]),
                            Container(
                              width: 1,
                              height: 56,
                              color: Colors.white,
                            ),
                            Score(
                                value: homePageData.values[2],
                                title: homePageData.titles[2]),

                            Visibility(

                              visible: context.isWebView,

                              child: Container(
                                width: 1,
                                height: 56,
                                color: Colors.white,
                              ),
                            ),

                            Visibility(

                              visible: context.isWebView,

                              child: Score(
                                  value: homePageData.values[3],
                                  title: homePageData.titles[3]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: Spacing.space16,
                            top: Spacing.space24,
                            bottom: Spacing.space12),
                        child: Text(
                          homePageData.description,
                          style: context
                              .textTheme.body1Normal,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),

        ListView.builder(
            physics:
            const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
            homePageData.homePageCards.length,
            itemBuilder: (context, index) {
              return HomePageRow(
                homePageCardData: homePageData
                    .homePageCards[index],
              );
            }),

      ],

    );

  }

}