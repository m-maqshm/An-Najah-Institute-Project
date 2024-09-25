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
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(lable! , style: const TextStyle(fontFamily: "mainFont" , fontSize: 25),),
          ),
          // SizedBox(height: 5),
          TextFormField(
            controller: controller,
            validator: validateInput,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle( fontSize: 12),
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
