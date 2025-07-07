import 'package:flutter/material.dart';
import 'package:vganalyzer/state_managers/WebConnect.dart';
import 'package:provider/provider.dart';
import 'package:vganalyzer/state_managers/nav.dart';

class PageZero extends StatefulWidget {
  const PageZero({super.key});

  @override
  State<PageZero> createState() => _PageZeroState();
}

class _PageZeroState extends State<PageZero> {
  final TextEditingController _extracted = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newModel = context.watch<NewsModel>();
    return Container(
      color: Colors.black,
      child: Container(
        color: Colors.blue[900]?.withAlpha(140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              width: MediaQuery.of(context).size.width * 4 / 5,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _extracted,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter the ip', border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              onPressed: () async {
                await newModel.fetchNewsAll(_extracted.text);
                await newModel.fetchNewsEco(_extracted.text);
                await newModel.fetchNewsMar(_extracted.text);
                await newModel.fetchNewsFin(_extracted.text);
                await newModel.fetchNewsInv(_extracted.text);
                await newModel.fetchNewsTec(_extracted.text);
                await newModel.fetchNewsSci(_extracted.text);
                await newModel.fetchNewsCur(_extracted.text);
                Provider.of<NavigationModel>(context, listen: false).setIndex(1);
              },
              child: Text("accept", style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
      ElevatedButton(
        onPressed: () async {
          await newModel.fetchNewsAll("192.168.99.240");
          await newModel.fetchNewsEco("192.168.99.240");
          await newModel.fetchNewsFin("192.168.99.240");
          await newModel.fetchNewsMar("192.168.99.240");
          await newModel.fetchNewsInv("192.168.99.240");
          await newModel.fetchNewsTec("192.168.99.240");
          await newModel.fetchNewsSci("192.168.99.240");
          await newModel.fetchNewsCur("192.168.99.240");
          Provider.of<NavigationModel>(context, listen: false).setIndex(1);
        },
        child: Text("fast", style: TextStyle(fontSize: 15)),
      ),
          ],
        ),
      ),
    );
  }
}
