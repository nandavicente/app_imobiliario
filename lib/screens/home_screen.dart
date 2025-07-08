import 'package:flutter/material.dart';
import 'alugar_screen.dart';
import 'novos_screen.dart';
import 'anuncie_screen.dart';
import 'nosso_time_screen.dart';
import 'sobre_nos_screen.dart';
import 'meus_anuncios_screen.dart';
import '../widgets/menu_image_button.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double contentWidth = screenWidth < 400 ? screenWidth * 0.9 : screenWidth * 0.8;

    return Scaffold(
      body: Column( // Directly use Column as the body
        children: [
          const SizedBox(height: 50),

          // Logo centralizada, menor e com pontas arredondadas
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
            child: Image.asset(
              'assets/images/logo.png',
              width: contentWidth * 0.6, // Reduced width (adjust multiplier as desired)
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 70), // Maior espaçamento entre logo e botões

          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    MenuImageButton(
                      image: 'assets/images/alugar.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AlugarScreen()),
                        );
                      },
                    ),
                    MenuImageButton(
                      image: 'assets/images/novos.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const NovosScreen()),
                        );
                      },
                    ),
                  MenuImageButton(
                    image: 'assets/images/anucieaqui.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AnuncieScreen()),
                      );
                    },
                  ),
                    MenuImageButton(
                      image: 'assets/images/nossotime.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const NossoTimeScreen()),
                        );
                      },
                    ),
                    MenuImageButton(
                      image: 'assets/images/sobrenos.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SobreNosScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




