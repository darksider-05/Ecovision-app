import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_managers/WebConnect.dart';

class GlobalPage extends StatelessWidget {

  final String pageTitle;
  final String pageVar;
  const GlobalPage({super.key, required this.pageTitle, required this.pageVar});

  @override
  Widget build(BuildContext context) {
    final newModel = context.watch<NewsModel>();
    final newsList = newModel.getNewsListByKey(pageVar);

    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 12.1818),
          color: Color(0xff0D1117),
          child: Text(
            pageTitle,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),

        SizedBox(
          height: (MediaQuery.of(context).size.height-116 > 0) ? MediaQuery.of(context).size.height-116 : MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color(0xff0D1117),
            child:
            (newsList.isEmpty)
                ? ListView(
              children: [
                Center(
                  child: Text(
                    "no data is available about this category right now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
                : ListView.builder(
              itemCount:
              newsList.length, ///////////////////////////////////
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Column(
                    children: [
                      NewsBox(listData: newsList[index]),
                    ], //////////////////////////////////////////
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class NewsBox extends StatelessWidget {
  final Map<String, dynamic> listData;
  const NewsBox({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff21262D),

      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: Color(0xff30363d),
                width: 1
            )
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                listData["title"],
                textDirection: checkEng(listData["title"]),
                style: TextStyle(fontSize: 17, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.tealAccent),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                listData["summary"],
                textDirection: checkEng(listData["summary"]),
                style: TextStyle(fontSize: 15, color: Color(0xff8B949E)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


TextDirection checkEng(String phrase){
  List ench = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
  ];
  for (String character in ench) {
    if (phrase.contains(character)) {
      return TextDirection.ltr;
    }
  }

  return TextDirection.rtl;
}