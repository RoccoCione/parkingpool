import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkin Pool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Alatsi',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      body: SafeArea(
        child: Stack(
          children: [
            // 1. IL CONTENUTO DELLA PAGINA
            // Usiamo IndexedStack per mantenere lo stato delle pagine (opzionale)
            // oppure un semplice switch come qui sotto:
            Padding(
              padding: const EdgeInsets.only(bottom: 100), // Spazio per la nav
              child: _getPageContent(_selectedIndex),
            ),

            // 2. LA NAVBAR
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 10,
                      offset: const Offset(-5, -5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.home, 0),
                    _buildNavItem(Icons.person, 1),
                    _buildNavItem(Icons.directions_car, 2),
                    _buildNavItem(Icons.settings, 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Selettore della pagina
  Widget _getPageContent(int index) {
    switch (index) {
      case 0:
        return const HomePage(); // Va alla homepage
      case 3:
        return const SettingsPage(); // Va alle impostazioni
      default:
        return const Center(child: Text("Pagina in costruzione"));
    }
  }

  // Widget icona nav bar
  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;
    return IconButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      icon: Icon(
        icon,
        size: isSelected ? 45 : 35,
        color: isSelected ? const Color(0xFF347487) : const Color(0xFF333333),
      ),
    );
  }
}