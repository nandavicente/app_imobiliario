import 'package:flutter/material.dart';

class ComprarScreen extends StatelessWidget {
  const ComprarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imóveis à Venda")),
      body: ListView(
        children: const [
          ListTile(title: Text("Casa 1 - R\$130.000")),
          ListTile(title: Text("Casa 2 - R\$95.000")),
        ],
      ),
    );
  }
}
