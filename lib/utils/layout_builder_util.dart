import 'package:cambridge_wealth/utils/size_config.dart';
import 'package:flutter/cupertino.dart';

class LayoutBuilderUtil extends StatelessWidget {
  final Widget webView, phoneView;

  const LayoutBuilderUtil(
      {Key? key, required this.webView, required this.phoneView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(context);

      if (constraints.maxWidth > 800) {
        return SafeArea(
          child: webView,
        );
      } else {
        return SafeArea(
          child: phoneView,
        );
      }
    });
  }
}
