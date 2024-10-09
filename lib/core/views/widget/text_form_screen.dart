import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormScreen extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? lable, hint;
  Color? backcolor;
  FormFieldValidator<String?>? validateInput;

  TextFormScreen(
      {super.key, this.controller, this.hint,this.validateInput, this.lable, this.backcolor,this.keyboardType});

  @override
  Widget build(BuildContext context) {

    double width =  MediaQuery.of(context).size.width;
    
    return Container(
      
      width: width*0.9,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 15),
            child: Text('$lable' , style: Theme.of(context).textTheme.bodyMedium/*TextStyle(fontFamily: "shahdFont" , fontSize: 16)*/,),
          ),
          // SizedBox(height: 5),
          TextFormField(

            controller: controller,
            validator: validateInput,
            keyboardType: keyboardType,
            style: TextStyle(fontSize: 13),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
              hintText: hint,
              hintStyle: const TextStyle(fontFamily: "shorog",fontSize: 15, color: Color.fromARGB(255, 91, 91, 91,)),
              filled: true,
              fillColor:  backcolor??Color.fromARGB(255, 216, 210, 185),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
