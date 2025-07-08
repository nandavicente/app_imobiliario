import 'package:flutter/material.dart';

class NovosScreen extends StatelessWidget {
  const NovosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imóveis Novos")),
      body: ListView(
        children: const [
          ListTile(title: Text("Na planta")),
          ListTile(title: Text("Lançamentos")),
          ListTile(title: Text("Em construção")),
        ],
      ),
    );
  }
}
