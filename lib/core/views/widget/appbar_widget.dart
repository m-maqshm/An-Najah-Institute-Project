import 'package:flutter/material.dart';
import 'notificationdialog.dart'; 

class AppbarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<String> notifications = ['الإشعار 1', 'الإشعار 2', 'الإشعار...................... 3'];

  AppbarWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.06,
      width: width,
      color: const Color.fromARGB(255, 64, 161, 194),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white, size: 25),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationDialog(notifications: notifications); 
                      },
                    );
                  },
                ),
              ),
              Positioned(
                right: 10,
                top: 4,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}