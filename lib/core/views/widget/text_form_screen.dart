import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormScreen extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? lable, hint;
  FormFieldValidator<String?>? validateInput;

  TextFormScreen(
      {super.key, this.controller, this.hint,this.validateInput, this.lable, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 15),
            child: Text('$lable' , style: Theme.of(context).textTheme.bodyMedium/*TextStyle(fontFamily: "shahdFont" , fontSize: 16)*/,textAlign:TextAlign.right,textDirection: TextDirection.rtl,),
          ),
          // SizedBox(height: 5),
          TextFormField(
            textAlign:TextAlign.right,textDirection: TextDirection.rtl,
            controller: controller,
            validator: validateInput,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontFamily: "shorog",fontSize: 15, color: Colors.black),
              filled: true,
              fillColor: const Color.fromARGB(255, 216, 210, 185),
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
