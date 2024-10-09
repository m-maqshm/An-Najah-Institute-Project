import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardDeveloper extends StatelessWidget {
  String? name ;
  String? rool ;
  String? email ;
  String? imageUrl ;
   CardDeveloper({super.key , this.name , this.rool , this.email , this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: height * 0.11,
          width: width * 0.2,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 253, 253, 253),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  '$imageUrl'), 
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text('$name'),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  '$rool',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  '$email',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
