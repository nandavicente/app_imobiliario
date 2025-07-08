import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MinhasVisitasScreen extends StatefulWidget {
  const MinhasVisitasScreen({super.key});

  @override
  State<MinhasVisitasScreen> createState() => _MinhasVisitasScreenState();
}

class _MinhasVisitasScreenState extends State<MinhasVisitasScreen> {
  List<Map<String, String>> visitas = [];

  @override
  void initState() {
    super.initState();
    carregarVisitas();
  }

  // Carrega as visitas salvas no SharedPreferences
  void carregarVisitas() async {
    final prefs = await SharedPreferences.getInstance();
    final visitasJson = prefs.getString('visitas');

    if (visitasJson != null) {
      final List decoded = jsonDecode(visitasJson);
      setState(() {
        visitas = decoded.cast<Map<String, String>>();
      });
    }
  }

  // Salva as visitas sempre que uma nova for adicionada
  void salvarVisitas() async {
    final prefs = await SharedPreferences.getInstance();
    final visitasJson = jsonEncode(visitas);
    await prefs.setString('visitas', visitasJson);
  }

  //  Adiciona uma nova visita (você chamaria isso de outra tela)
  void adicionarVisita(Map<String, String> novaVisita) {
    setState(() {
      visitas.add(novaVisita);
    });
    salvarVisitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Visitas'),
        centerTitle: true,
      ),
      body: visitas.isEmpty
          ? const Center(child: Text('Nenhuma visita agendada.'))
          : ListView.builder(
        itemCount: visitas.length,
        itemBuilder: (context, index) {
          final visita = visitas[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.home_work),
              title: Text(visita['titulo'] ?? ''),
              subtitle: Text(
                'Data: ${visita['data']} • Horário: ${visita['hora']}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    visitas.removeAt(index);
                    salvarVisitas();
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
