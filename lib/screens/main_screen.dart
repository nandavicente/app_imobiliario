import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'meus_anuncios_screen.dart';
import 'perfil_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _paginaAtual = 0;

  final List<Widget> _paginas = const [
    HomeScreen(),
    MeusAnunciosScreen(),
    PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This is crucial for the gradient to extend behind the bottom navigation bar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD32F2F), // rosa claro
              Color(0xFFFFCDD2), // rosa muito claro
              Colors.white,
            ],
          ),
        ),
        child: _paginas[_paginaAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove shadow
        selectedItemColor: const Color(0xFFD32F2F),
        unselectedItemColor: Colors.black54,
        currentIndex: _paginaAtual, // Use _paginaAtual to reflect the current page
        onTap: (index) {
          setState(() {
            _paginaAtual = index; // Update the current page index
          });
          // You might not need these push navigators if you're using a single Scaffold with indexed stack
          // If you still want to navigate, consider using Navigator.pushReplacement for better navigation flow
          if (index == 1) {
            //Navigator.push(
            //  context,
            //  MaterialPageRoute(builder: (_) => const MeusAnunciosScreen()),
            //);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Meus Anúncios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
      ),
    );
  }
}


