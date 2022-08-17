import 'package:cambridge_wealth/bloc/homepage/bloc.dart';
import 'package:cambridge_wealth/bloc/homepage/event.dart';
import 'package:cambridge_wealth/bloc/homepage/state.dart';
import 'package:cambridge_wealth/models/bottom_navigation_item_data.dart';
import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:cambridge_wealth/utils/style.dart';
import 'package:cambridge_wealth/widgets/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../webpages/bottom_navigation_item.dart';
import '../widgets/home_page_row.dart';
import '../widgets/notification_section.dart';
import '../widgets/user_settings.dart';

class PhoneHome extends StatefulWidget {
  const PhoneHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PhoneHomeState();
}

class PhoneHomeState extends State<PhoneHome> {
  List<NavigationButtonData> actions = [
    NavigationButtonData(icon: Icons.home, name: 'Home'),
    NavigationButtonData(icon: Icons.settings, name: 'Settings')
  ];

  late HomePageBloc homePageBloc;

  bool isNotificationSelected = false;

  int selectedIndex = 0;

  @override
  void initState() {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    homePageBloc.add(FetchHomePageData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.displayHeight / 2.5,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/homebg.png'),
                fit: BoxFit.fitWidth),
          ),
        ),
        Container(
          decoration: const BoxDecoration(gradient: Gradients.backGround),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            Widget widget = const SizedBox();

            if (state is FetchingState) {
              widget = const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is FetchedState) {
              HomePageData homePageData = state.homePageData;
              if (isNotificationSelected) {
                widget = const NotificationSection(
                    marginLeft: Spacing.space16,
                    marginRight: Spacing.space16,
                    marginTop: Spacing.space16);
              } else {
                if (selectedIndex == 0) {
                  widget = SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: Spacing.space24,
                              left: Spacing.space24,
                              top: Spacing.space40,
                              bottom: Spacing.space32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 56,
                                width: 56,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/applogo.png'),
                                        fit: BoxFit.cover,
                                        scale: 0.1)),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isNotificationSelected = true;
                                    selectedIndex = -1;
                                  });
                                },
                                child: Container(
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
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: Spacing.space24,
                              right: Spacing.space24,
                              bottom: Spacing.space16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 8,
                                height: context.displayHeight * 0.15,
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
                                        const Score(
                                            value: '14,552', title: 'SCORE'),
                                        Container(
                                          width: 1,
                                          height: 56,
                                          color: Colors.white,
                                        ),
                                        const Score(
                                            value: '10,552', title: 'CREDIT'),
                                        Container(
                                          width: 1,
                                          height: 56,
                                          color: Colors.white,
                                        ),
                                        const Score(
                                            value: '1,552', title: 'COINS'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: Spacing.space16,
                                        top: Spacing.space12,
                                        bottom: Spacing.space12),
                                    child: Text(
                                      homePageData.description,
                                      style: context.textTheme.body1Normal,
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
                            itemCount: homePageData.homePageCards.length,
                            itemBuilder: (context, index) {
                              return HomePageRow(
                                homePageCardData:
                                    homePageData.homePageCards[index],
                              );
                            }),
                      ],
                    ),
                  );
                } else {
                  widget = const UserSettings(
                    marginTop: Spacing.space32,
                    marginRight: Spacing.space16,
                    marginLeft: Spacing.space16,
                  );
                }
              }
            } else if (state is ErrorState) {
              widget = Center(
                child: Text(
                  state.message,
                  style: context.textTheme.h2,
                ),
              );
            }
            return widget;
          }),
          bottomNavigationBar: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: Colors.grey[900]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: BottomNavigationButton(
                            navigationButtonData: actions[0],
                            onClick: () {
                              setState(() {
                                selectedIndex = 0;
                                isNotificationSelected = false;
                              });
                            },
                            selected: selectedIndex == 0)),
                    Expanded(
                        child: BottomNavigationButton(
                            navigationButtonData: actions[1],
                            onClick: () {
                              setState(() {
                                selectedIndex = 1;
                                isNotificationSelected = false;
                              });
                            },
                            selected: selectedIndex == 1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
