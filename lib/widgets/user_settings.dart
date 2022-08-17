import 'package:cambridge_wealth/widgets/settings_row.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class UserSettings extends StatelessWidget{

  final double marginTop, marginLeft, marginRight;

  const UserSettings({Key? key, required this.marginTop, required this.marginLeft, required this.marginRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          right: marginRight,
          left: marginLeft),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: Spacing.space32),
                      child: Text(
                        'Settings',
                        style: context.textTheme.h1,
                      ),
                    )),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: const Icon(Icons.settings),
                ),
              ],
            ),

            const SizedBox(height: Spacing.space16,),
            GridView.count(crossAxisCount: context.displayWidth ~/ ((context.displayWidth > 800) ? 240 : 120),
              childAspectRatio: 6/8,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: const [

                SettingsRow(icon: Icons.person, title: 'Account'),
                SettingsRow(icon: Icons.wb_sunny_outlined, title: 'Theme'),
                SettingsRow(icon: Icons.delete, title: 'Delete'),
                SettingsRow(icon: Icons.card_giftcard, title: 'Rewards'),
                SettingsRow(icon: Icons.feedback, title: 'Feedback'),
                SettingsRow(icon: Icons.logout, title: 'Log out'),

              ],

            )
          ],
        ),
      ),
    );

  }

}