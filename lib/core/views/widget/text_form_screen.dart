import 'package:flutter/material.dart';

class TextFormScreen extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? label, hint;
  final Color? backgroundColor;
  final FormFieldValidator<String?>? validateInput;

  TextFormScreen({
    super.key,
    this.controller,
    this.hint,
    this.validateInput,
    this.label,
    this.backgroundColor,
    this.keyboardType, 
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            validator: validateInput,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: hint,
              hintStyle: const TextStyle(fontFamily: "shorog", fontSize: 15, color: Color.fromARGB(255, 91, 91, 91)),
              filled: true,
              fillColor: backgroundColor ?? const Color.fromARGB(255, 216, 210, 185),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
