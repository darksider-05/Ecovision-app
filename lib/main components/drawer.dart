import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_managers/nav.dart';

class DrawerW extends StatelessWidget {
  const DrawerW({super.key});

  @override
  Widget build(BuildContext context) {
    final navModel = context.watch<NavigationModel>();

    return Drawer(
      child: Container(
        color: Color(0xff21262D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Color(0xff0D1117)),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Topics',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -2), // move up by 2 pixels
              child: Container(
                height: 2,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 1 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'All News',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation here
                navModel.setIndex(1);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 2 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Economy',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(2);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 3 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Finance',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(3);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 4 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Markets',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(4);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 5 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Investing',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(5);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 6 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Technology',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(6);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 7 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Science',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(7);
                Scaffold.of(context).closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color:
                    navModel.currentIndex == 8 ? Colors.teal : Colors.white,
              ),
              title: Text(
                'Currencies',
                style: TextStyle(color: Colors.white),
              ), ////////////////////////////
              onTap: () {
                // Handle navigation here
                navModel.setIndex(8);
                Scaffold.of(context).closeDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
