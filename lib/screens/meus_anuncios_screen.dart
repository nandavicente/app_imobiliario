import 'package:flutter/material.dart';

class MeusAnunciosScreen extends StatelessWidget {
  const MeusAnunciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulação de anúncios (pode vir de um banco ou API futuramente)
    final anuncios = [
      {'titulo': 'Apartamento no Centro', 'valor': 'R\$ 1.200/mês'},
      {'titulo': 'Casa com quintal', 'valor': 'R\$ 950/mês'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Anúncios'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFD32F2F),
        elevation: 1,
      ),
      body: anuncios.isEmpty
          ? const Center(
        child: Text(
          'Você ainda não possui anúncios.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: anuncios.length,
        itemBuilder: (context, index) {
          final anuncio = anuncios[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFFD32F2F), width: 1),
              ),
              elevation: 2,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  anuncio['titulo']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  anuncio['valor']!,
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  // Aqui você poderá abrir uma tela de edição ou detalhes futuramente
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
