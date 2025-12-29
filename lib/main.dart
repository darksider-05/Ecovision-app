import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state_managers/nav.dart';
import 'state_managers/WebConnect.dart';
import 'main components/drawer.dart';
import 'main components/appbar.dart';
import '../pages/page0.dart';
import "../pages/pageG.dart";
import "../pages/crypto.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationModel()),
        ChangeNotifierProvider(create: (_) => NewsModel()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPart()),
    ),
  );
}

class MainPart extends StatelessWidget {
  const MainPart({super.key});

  @override
  Widget build(BuildContext context) {
    final navModel = context.watch<NavigationModel>();

    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: (navModel.currentIndex != 0) ? DrawerW() : null,
      appBar: (navModel.currentIndex != 0) ? Apbr() : null,
      body: IndexedStack(
        index: navModel.currentIndex,
        children: [
          (navModel.currentIndex == 0) ? PageZero() : Container(),
          GlobalPage(pageTitle: "all news", pageVar: "allNews"),
          GlobalPage(pageTitle: "Economy", pageVar: "ecoNews"),
          GlobalPage(pageTitle: "Finance", pageVar: "finNews"),
          GlobalPage(pageTitle: "Market", pageVar: "marNews"),
          GlobalPage(pageTitle: "Investing", pageVar: "invNews"),
          GlobalPage(pageTitle: "Technology", pageVar: "tecNews"),
          GlobalPage(pageTitle: "Science", pageVar: "sciNews"),
          CryPage(),
        ],
      ),
    );
  }
}
