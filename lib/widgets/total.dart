import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Total extends StatefulWidget {
  final String value;

  Total({required this.value});

  @override
  _Total createState() => _Total();
}

class _Total extends State<Total> {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.attach_money,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              widget.value,
              style: GoogleFonts.montserrat(
                  fontSize: 32, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
