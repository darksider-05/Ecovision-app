import 'package:flutter/material.dart';
import 'package:vganalyzer/state_managers/WebConnect.dart';
import 'package:provider/provider.dart';
import 'package:vganalyzer/state_managers/nav.dart';

class PageZero extends StatelessWidget {
  PageZero({super.key});

  final TextEditingController _extracted = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newModel = context.watch<NewsModel>();
    return Container(
      color: Color(0xff21262D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff30363d),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            width: MediaQuery.of(context).size.width * 4 / 5,
            padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
            child: TextField(
              autofocus: false,
              controller: _extracted,
              style: const TextStyle(color: Colors.white54),
              cursorColor: Colors.tealAccent,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                       BorderSide(
                            color: Colors.deepPurple.shade700,
                            width: 2,
                          )

                ),
                labelText: 'Enter the IP',
                hintText: 'example: "192.168.99.142"',
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff30363d)),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await Future.wait([
                newModel.fetchNewsAll(_extracted.text),
                newModel.fetchNewsEco(_extracted.text),
                newModel.fetchNewsMar(_extracted.text),
                newModel.fetchNewsFin(_extracted.text),
                newModel.fetchNewsInv(_extracted.text),
                newModel.fetchNewsTec(_extracted.text),
                newModel.fetchNewsSci(_extracted.text),
                newModel.fetchNewsCur(_extracted.text),
              ]);
              Provider.of<NavigationModel>(context, listen: false).setIndex(1);
            },
            child: Text(
              "accept",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 1 / 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff30363d)),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await Future.wait([
                newModel.fetchNewsAll("192.168.99.240"),
                newModel.fetchNewsEco("192.168.99.240"),
                newModel.fetchNewsMar("192.168.99.240"),
                newModel.fetchNewsFin("192.168.99.240"),
                newModel.fetchNewsInv("192.168.99.240"),
                newModel.fetchNewsTec("192.168.99.240"),
                newModel.fetchNewsSci("192.168.99.240"),
                newModel.fetchNewsCur("192.168.99.240"),
              ]);
              Provider.of<NavigationModel>(context, listen: false).setIndex(1);
            },
            child: Text(
              "Dev",
              style: TextStyle(fontSize: 15, color: Colors.orange[700]),
            ),
          ),
        ],
      ),
    );
  }
}
