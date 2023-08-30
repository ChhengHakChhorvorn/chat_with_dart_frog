import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? label;

  const CustomButton({super.key, this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        color: Colors.deepPurple.shade200,
        child: Text(
          label ?? '',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
