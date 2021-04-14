import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String description;
  final void Function() onTap;

  // const Button({
  //   required this.description,
  // });
  const Button({required this.onTap, required this.description});

  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.orangeAccent[100]),
          child: Center(
              child: Text(
            description,
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
