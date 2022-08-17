import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/material.dart';

class HomePageRow extends StatelessWidget {
  final HomePageCardData homePageCardData;

  const HomePageRow({Key? key, required this.homePageCardData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Spacing.space24, vertical: Spacing.space8),
      padding: const EdgeInsets.all(Spacing.space8),
      decoration: BoxDecoration(
        color: context.colorScheme.blackShade,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: Spacing.space8),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/common.png',
              width: 12,
              height: 12,
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    homePageCardData.description,
                    style: context.textTheme.body1Regular,
                  ))),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.star,
                color: context.colorScheme.primaryColor,
                size: 48,
              ),
              Text(
                homePageCardData.rating,
                style: context.textTheme.body2Regular
                    .copyWith(fontSize: 10, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
