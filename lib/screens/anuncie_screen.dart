import 'package:flutter/material.dart';

class AnuncieScreen extends StatefulWidget {
  const AnuncieScreen({super.key});

  @override
  State<AnuncieScreen> createState() => _AnuncieScreenState();
}

class _AnuncieScreenState extends State<AnuncieScreen> {
  final _formKey = GlobalKey<FormState>();

  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final descricaoController = TextEditingController();
  String tipoSelecionado = 'Casa';

  final List<String> tipos = ['Casa', 'Apartamento', 'Sítio', 'Kitnet', 'Terreno'];

  void publicarAnuncio() {
    if (_formKey.currentState!.validate()) {
      // Aqui você pode enviar para o backend ou salvar localmente
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Imóvel publicado com sucesso!')),
      );

      // Limpar os campos
      tituloController.clear();
      valorController.clear();
      descricaoController.clear();
      setState(() {
        tipoSelecionado = 'Casa';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery
        .of(context)
        .size
        .width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anunciar Imóvel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 500),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: tituloController,
                    decoration: const InputDecoration(
                        labelText: 'Título do imóvel'),
                    validator: (value) =>
                    value!.isEmpty
                        ? 'Informe o título'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: valorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Valor'),
                    validator: (value) =>
                    value!.isEmpty
                        ? 'Informe o valor'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: tipoSelecionado,
                    items: tipos.map((tipo) {
                      return DropdownMenuItem(value: tipo, child: Text(tipo));
                    }).toList(),
                    decoration: const InputDecoration(
                        labelText: 'Tipo de imóvel'),
                    onChanged: (value) =>
                        setState(() => tipoSelecionado = value!),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: descricaoController,
                    maxLines: 4,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    validator: (value) =>
                    value!.isEmpty
                        ? 'Descreva o imóvel'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: publicarAnuncio,
                    icon: const Icon(Icons.send),
                    label: const Text('Publicar'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
