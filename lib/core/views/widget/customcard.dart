import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String? title;
  String? imageUrl;
  String? state;
  String? date;
  String? certificatesNum;

  CustomCard(
      {required this.title,
      required this.imageUrl,
      required this.state,
      required this.date,
      required this.certificatesNum});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: const Color.fromARGB(132, 236, 99, 8),
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.1,
              width: width * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Image.asset('$imageUrl', fit: BoxFit.cover),
            ),
            SizedBox(width: width * 0.07),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          "جاهزية الشهادة -  $state",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.00,
                      ),
                      Center(
                        child: Text("تاريخ الإصدار - $date",
                            style: TextStyle(fontSize: 13)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Text(
                    "رقم الشهادة",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "$certificatesNum",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
