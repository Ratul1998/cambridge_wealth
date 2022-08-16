import 'package:cambridge_wealth/mobilescreen/phone_home.dart';
import 'package:cambridge_wealth/utils/layout_builder_util.dart';
import 'package:cambridge_wealth/webpages/web_home.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget{

  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return const LayoutBuilderUtil(webView: WebHome(), phoneView: PhoneHome());

  }

}