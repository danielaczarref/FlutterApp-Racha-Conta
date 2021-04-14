import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final void Function() onPressedHome;
  final void Function() onPressedPerson;
  final void Function() onPressedContacts;
  final void Function() onPressedAlerts;

  BottomBar({
    required this.onPressedHome,
    required this.onPressedPerson,
    required this.onPressedContacts,
    required this.onPressedAlerts,
  });

  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  bool isHomePressed = true;
  bool isPersonPressed = false;
  bool isContactsPressed = false;
  bool isAlertsPressed = false;

  void handleHome() {
    setState(() {
      isHomePressed = !isHomePressed;
      isPersonPressed = false;
      isContactsPressed = false;
      isAlertsPressed = false;
    });
    widget.onPressedHome();
  }

  void handlePerson() {
    setState(() {
      isHomePressed = false;
      isPersonPressed = !isPersonPressed;
      isContactsPressed = false;
      isAlertsPressed = false;
    });
    widget.onPressedPerson();
  }

  void handleContacts() {
    setState(() {
      isHomePressed = false;
      isPersonPressed = false;
      isContactsPressed = !isContactsPressed;
      isAlertsPressed = false;
    });
    widget.onPressedContacts();
  }

  void handleAlerts() {
    setState(() {
      isHomePressed = false;
      isPersonPressed = false;
      isContactsPressed = false;
      isAlertsPressed = !isAlertsPressed;
    });
    widget.onPressedAlerts();
  }

  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: 64,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => handleHome(),
                icon: Icon(isHomePressed ? Icons.home : Icons.home_outlined)),
            IconButton(
                onPressed: () => handlePerson(),
                icon: Icon(
                    isPersonPressed ? Icons.person : Icons.person_outline)),
            SizedBox(
              width: 64,
            ),
            IconButton(
                onPressed: () => handleContacts(),
                icon: Icon(isContactsPressed
                    ? Icons.supervisor_account
                    : Icons.supervisor_account_outlined)),
            IconButton(
                onPressed: () => handleAlerts(),
                icon: Icon(isAlertsPressed
                    ? Icons.notifications_active
                    : Icons.notifications_active_outlined)),
          ],
        ),
      ),
    );
  }
}
