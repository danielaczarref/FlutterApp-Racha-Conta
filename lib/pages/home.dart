import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button.dart';
import '../widgets/cardPerson.dart';
import '../widgets/total.dart';
import '../widgets/bottomBar.dart';

class BillSplitHomePage extends StatefulWidget {
  double originalValue;
  double total;

  BillSplitHomePage({this.originalValue = 90.85, this.total = 90.85});

  @override
  _BillSplitHomePageState createState() => _BillSplitHomePageState();
}

class _BillSplitHomePageState extends State<BillSplitHomePage> {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Novo valor'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Entre o valor da despesa"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Enviar'),
                onPressed: () {
                  print(_textFieldController.text);
                  var res = double.parse(_textFieldController.text);
                  setState(() {
                    widget.total = res;
                    widget.originalValue = res;
                    _textFieldController.text = "";
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<int> selected = List<int>.filled(0, 0, growable: true);

    void handleSelecaoContato(idContato) {
      print(selected);
      if (selected.contains(idContato)) {
        setState(() {
          selected.where((obj) => obj != idContato).toList();
        });
      }
      selected.add(idContato);
    }

    void handleDividirConta() {
      print(selected);
      if (selected.length == 0) {
        print(widget.total);
        setState(() {
          widget.total = widget.originalValue;
        });
      } else {
        var res = widget.total / (selected.length);
        print(res);
        setState(() {
          widget.total = res;
        });
      }
    }

    void handleHomePress() {
      print('tela inicial');
    }

    void handlePersonPress() {
      print('tela do usuário');
    }

    void handleContactsPress() {
      print('tela de conexões do usuário');
    }

    void handleAlertsPress() {
      print('tela de notificações');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    PhysicalModel(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: Icon(
                          Icons.pin_drop_outlined,
                          size: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "São Luís - MA",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),
              Total(value: widget.total.toString()),
              SizedBox(
                height: 8,
              ),
              Button(
                  onTap: () => handleDividirConta(),
                  description: 'Dividir conta'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Escolha com quem dividir",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CardPerson(
                          name: 'Daniela',
                          color: Colors.blue[100],
                          onPressed: () => handleSelecaoContato(1)),
                      CardPerson(
                          name: 'André',
                          color: Colors.yellow[100],
                          onPressed: () => handleSelecaoContato(2)),
                      CardPerson(
                          name: 'Juliana',
                          color: Colors.red[100],
                          onPressed: () => handleSelecaoContato(3)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
          onPressedHome: () => handleHomePress(),
          onPressedPerson: () => handlePersonPress(),
          onPressedContacts: () => handleContactsPress(),
          onPressedAlerts: () => handleAlertsPress()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
