import 'package:flutter/material.dart';
import '../state_managers/WebConnect.dart';
import 'package:provider/provider.dart';


class CryPage extends StatelessWidget {
  const CryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newModel = context.watch<NewsModel>();

    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 12.1818),
          color: Color(0xff0D1117),
          child: Text(
            "crypto",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),

        SizedBox(
          height: (MediaQuery.of(context).size.height-116 > 0) ? MediaQuery.of(context).size.height-116 : MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color(0xff0D1117),
            child:
            (newModel.curData.isEmpty)
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
              newModel.curData.length, ///////////////////////////////////
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Column(
                    children: [
                      CripBox(listData: newModel.curData[index]),
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


class CripBox extends StatelessWidget {
  final Map<String, dynamic> listData;
  const CripBox({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff21262D),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Color(0xff30363d),
                width: 1
            )
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  Text(listData["symbol"], style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text(listData["price"].toString(), style: TextStyle(color: Colors.white, fontSize: 18),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  Text(listData["name"], style: TextStyle(color: Color(0xff8B949E), fontSize: 14),),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: listData["positive"] ? Colors.green.withAlpha(190): Colors.red.withAlpha(190),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                      children: [
                        Transform.flip(flipY: true,child: Icon(Icons.change_history, fill: 1.0, color: listData["positive"] ? Colors.green: Colors.red)),
                        Text(listData["change"])
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
