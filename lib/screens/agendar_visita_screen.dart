import 'package:flutter/material.dart';

class AgendarVisitaScreen extends StatefulWidget {
  final String tituloImovel;

  const AgendarVisitaScreen({super.key, required this.tituloImovel});

  @override
  State<AgendarVisitaScreen> createState() => _AgendarVisitaScreenState();
}

class _AgendarVisitaScreenState extends State<AgendarVisitaScreen> {
  DateTime? dataSelecionada;
  TimeOfDay? horaSelecionada;

  void _selecionarData() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (data != null) {
      setState(() => dataSelecionada = data);
    }
  }

  void _selecionarHora() async {
    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (hora != null) {
      setState(() => horaSelecionada = hora);
    }
  }

  void _confirmarAgendamento() {
    if (dataSelecionada != null && horaSelecionada != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Visita agendada para ${dataSelecionada!.day}/${dataSelecionada!.month} às ${horaSelecionada!.format(context)}',
          ),
        ),
      );
      Navigator.pop(context); // Volta para tela de alugar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione data e hora')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.tituloImovel,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _selecionarData,
              icon: const Icon(Icons.calendar_today),
              label: Text(dataSelecionada == null
                  ? 'Selecionar Data'
                  : '${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _selecionarHora,
              icon: const Icon(Icons.access_time),
              label: Text(horaSelecionada == null
                  ? 'Selecionar Horário'
                  : horaSelecionada!.format(context)),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _confirmarAgendamento,
              child: const Text('Confirmar Agendamento'),
            ),
          ],
        ),
      ),
    );
  }
}
