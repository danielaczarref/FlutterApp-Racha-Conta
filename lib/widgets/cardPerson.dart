import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPerson extends StatefulWidget {
  final String name;
  final Color? color;
  final void Function() onPressed;

  CardPerson({
    required this.name,
    required this.color,
    required this.onPressed,
  });

  @override
  _CardPerson createState() => _CardPerson();
}

class _CardPerson extends State<CardPerson> {
  bool isAdded = false;

  void selectUser() {
    setState(() {
      isAdded = !isAdded;
    });
    widget.onPressed();
  }

  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: [
        Positioned(
            top: 8,
            right: 8,
            bottom: 16,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: widget.color, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: isAdded ? Colors.green[200] : Colors.blue[200],
            foregroundColor: Colors.white,
            child: IconButton(
                onPressed: () => selectUser(),
                icon: Icon(isAdded ? Icons.check : Icons.add)),
          ),
        )
      ],
    ));
  }
}
