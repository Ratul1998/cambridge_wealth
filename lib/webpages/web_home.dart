import 'package:cambridge_wealth/bloc/homepage/bloc.dart';
import 'package:cambridge_wealth/bloc/homepage/event.dart';
import 'package:cambridge_wealth/bloc/homepage/state.dart';
import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:cambridge_wealth/widgets/SideNavigationBar.dart';
import 'package:cambridge_wealth/widgets/notification_section.dart';
import 'package:cambridge_wealth/widgets/score_layout.dart';
import 'package:cambridge_wealth/widgets/user_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/style.dart';
import 'package:flutter/material.dart';


class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebHomeState();
}

class WebHomeState extends State<WebHome> {
  late HomePageBloc homePageBloc;

  int selectedIndex = 0;

  callback(index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/webbg.png'), fit: BoxFit.fill),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: [
              SideNavigationBar(
                callback: callback,
                selectedIndex: selectedIndex,
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 0, left: 40, right: 40, top: 56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HOME > DETAILS',
                      style: context.textTheme.body2Regular,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(8).copyWith(left: 0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            color:
                                context.colorScheme.blackShade.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                            border: Border.all(color: Colors.white.withOpacity(0.3))),
                        child: BlocBuilder<HomePageBloc, HomePageState>(
                            builder: (context, state) {
                          Widget widget = const SizedBox();

                          if (state is FetchingState) {
                            widget = Center(
                              child: CircularProgressIndicator(
                                color: context.colorScheme.primaryColor,
                              ),
                            );
                          } else if (state is FetchedState) {
                            HomePageData homePageData = state.homePageData;
                            if (selectedIndex == 0) {
                              widget = RawScrollbar(
                                isAlwaysShown: true,
                                thumbColor: Colors.grey[800],
                                radius: const Radius.circular(8),
                                thickness: 4,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: Spacing.space32,
                                            top: Spacing.space40,
                                            bottom: Spacing.space32),
                                        child: Text(
                                          'TITLE',
                                          style: context.textTheme.h1,
                                        ),
                                      ),
                                      ScoreLayout(homePageData: homePageData),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              widget = const UserSettings(
                                  marginTop: Spacing.space32,
                                  marginLeft: Spacing.space16,
                                  marginRight: Spacing.space16);
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
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: NotificationSection(
                marginLeft: 0,
                marginRight: Spacing.space56,
                marginTop: Spacing.space40,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
