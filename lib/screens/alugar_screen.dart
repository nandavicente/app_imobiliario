import 'package:flutter/material.dart';
import 'agendar_visita_screen.dart';

class AlugarScreen extends StatelessWidget {
  const AlugarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de imóveis
    final imoveis = [
      {'titulo': 'Casa com 3 quartos', 'valor': 'R\$ 1.200'},
      {'titulo': 'Apartamento no centro', 'valor': 'R\$ 950'},
      {'titulo': 'Kitnet mobiliada', 'valor': 'R\$ 650'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imóveis para Alugar'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: imoveis.length,
        itemBuilder: (context, index) {
          final imovel = imoveis[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(imovel['titulo']!),
              subtitle: Text(imovel['valor']!),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AgendarVisitaScreen(
                        tituloImovel: imovel['titulo']!,
                      ),
                    ),
                  );
                },
                child: const Text('Agendar Visita'),
              ),
            ),
          );
        },
      ),
    );
  }
}
