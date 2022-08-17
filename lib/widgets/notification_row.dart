import 'package:cambridge_wealth/models/notification_data.dart';
import 'package:cambridge_wealth/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatefulWidget {
  final NotificationData notificationData;

  const NotificationRow({Key? key, required this.notificationData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NotificationRowState();
}

class NotificationRowState extends State<NotificationRow> {
  bool isExpanded = false;
  String description = '';

  @override
  void initState() {
    description = widget.notificationData.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Spacing.space8),
      padding: const EdgeInsets.all(Spacing.space12),
      decoration: BoxDecoration(
        color: context.colorScheme.blackShade,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.only(right: Spacing.space8),
            decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Image.asset(
              widget.notificationData.iconPath,
              width: 44,
              height: 44,
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(right: Spacing.space8),
            child: RichText(
                text: TextSpan(
                    text: isExpanded
                        ? description
                        : description.length > 100
                            ? description.substring(0, 100)
                            : description,
                    style: context.textTheme.body1Regular,
                    children: widget.notificationData.description.length >
                                100 &&
                            !isExpanded
                        ? [
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: 'Read more...',
                                style: context.textTheme.body1Regular.copyWith(
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isExpanded = true;
                                    });
                                  })
                          ]
                        : [])),
          )),
        ],
      ),
    );
  }
}
