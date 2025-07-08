import 'package:flutter/material.dart';

class SobreNosScreen extends StatelessWidget {
  const SobreNosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre Nós')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Somos uma imobiliária dedicada a transformar o sonho da casa própria em realidade.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
