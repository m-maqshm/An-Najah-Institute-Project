import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(


      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      backgroundColor: const Color.fromARGB(255, 138, 168,217),
      title: const   ListTile(
          leading: Padding(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Al-Najah Institute",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          subtitle: Text("alNajah@gmail.com",
              style: TextStyle(fontSize: 12, color: Colors.white)),
        ),

      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
