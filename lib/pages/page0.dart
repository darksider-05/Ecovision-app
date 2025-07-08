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
            child: Text(
              "accept",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 1 / 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff30363d)),
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
