import 'package:flutter/material.dart';

class ContenrDetalsapp extends StatelessWidget {
  String? title , text;
  ContenrDetalsapp({super.key,required this.title,required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(
                223, 221, 239, 0.6196078431372549)
        ),
        padding: EdgeInsets.only(top: 10,right: 15,bottom: 5),
        margin: EdgeInsets.symmetric(vertical: 3),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Text('$title  : ',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
            30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
            Text(text=='null'?"لم يتم التحديد بعد":'${text }',style: Theme.of(context).textTheme.titleMedium /*TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color.fromRGBO(
            30, 42, 72, 1.0))*/,textAlign: TextAlign.right,textDirection: TextDirection.rtl,                                                    overflow: TextOverflow.ellipsis,
                ),
            // Text('$title: $text $text',
            //   overflow: TextOverflow.ellipsis,
            //   maxLines: 1,textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: Theme.of(context).textTheme.titleMedium,)
          ],),),
    );
  }
}

// import 'package:flutter/material.dart';

class DataDisplayWidget extends StatelessWidget {
  final Map<String, String> data; // البيانات التي تأتي من الـ API (العناوين والمحتويات)

  DataDisplayWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildTextWidgets(),
        ),
      ),
    );
  }

  // دالة تقوم ببناء قائمة من الويجتس النصية بناءً على البيانات الواردة من الـ API
  List<Widget> _buildTextWidgets() {
    List<Widget> textWidgets = [];

    data.forEach((title, content) {
      // إضافة العنوان بتنسيق خاص
      textWidgets.add(
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18, color: Colors.black), // التنسيق الأساسي
            children: [
              TextSpan(
                text: "$title: ", // العنوان
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );

      // إضافة المحتوى بتنسيق خاص
      textWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0), // مسافة بين النصوص
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black), // التنسيق الأساسي
              children: [
                TextSpan(
                  text: content + ".", // المحتوى الذي يتم جلبه من API
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

    return textWidgets;
  }
}