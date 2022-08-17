import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final String value;
  final String title;

  const Score({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.space20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: Spacing.space8),
              child: Text(
                value,
                style: context.textTheme.h1,
              ),
            ),
            Text(
              title,
              style: context.textTheme.h2,
            ),
          ],
        ),
      ),
    );
  }
}
