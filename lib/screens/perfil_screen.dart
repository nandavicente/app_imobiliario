import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Maria Fernanda',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'maria@ifnmg.edu.br',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),

                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Função de edição ainda não implementada')),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar dados'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
                const SizedBox(height: 16),

                OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Deseja sair?'),
                        content: const Text('Essa ação simula um logout.'),
                        actions: [
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text('Sair'),
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Você saiu da conta')),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Sair'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
