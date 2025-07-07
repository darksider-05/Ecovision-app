import 'package:flutter/material.dart';
import '../state_managers/nav.dart';
import 'package:provider/provider.dart';

class Apbr extends StatelessWidget implements PreferredSizeWidget {
  const Apbr({super.key});

  @override
  Widget build(BuildContext context) {
    final navModel = context.watch<NavigationModel>();

    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      title: Text("VGAnalyzer", style: TextStyle(color: Colors.white),),
      backgroundColor: Color(0xff14252F),
      actions: [
        IconButton(
          onPressed: () {
            navModel.setIndex(0);
          },
          icon: Icon(Icons.settings_backup_restore_outlined, color: Colors.white38,),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight - 15);
}
