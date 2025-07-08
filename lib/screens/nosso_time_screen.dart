import 'package:flutter/material.dart';

class NossoTimeScreen extends StatelessWidget {
  const NossoTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nosso time")),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Corretor João"),
            subtitle: Text("Descrição curta"),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Corretor Fábio"),
            subtitle: Text("Descrição curta"),
          ),
        ],
      ),
    );
  }
}
