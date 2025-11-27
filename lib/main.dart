import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color(0xFFEBEBEB);
    final Color buttonColor = const Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // --------------------------------------------------
            // IL TITOLO + MENU A TENDINA
            // --------------------------------------------------
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Mantiene la riga compatta al centro
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Mappa dei parcheggi',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10), // Spazio tra titolo e menu

                    // --- MENU A TENDINA  ---
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu, size: 30, color: Colors.black), // Icona hamburger
                      onSelected: (String result) {
                        // Qui gestisci cosa succede quando clicchi un'opzione
                        print('Hai cliccato: $result');
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Opzione 1',
                          child: Text('Fisciano'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Opzione 2',
                          child: Text('Baronissi'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Opzione 3',
                          child: Text('Avellino'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // --------------------------------------------------
            // 2. I BOTTONI (Accedi / Esco)
            // --------------------------------------------------
            Positioned(
              bottom: 100, // Alzati leggermente per non toccare la nav bar
              left: 30,
              right: 30,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton("Accedi", buttonColor),
                  _buildActionButton("Esco", buttonColor),
                ],
              ),
            ),

            // --------------------------------------------------
            // 3. LA BARRA DI NAVIGAZIONE PERSONALIZZATA
            // --------------------------------------------------
            Positioned(
              bottom: 0, // Leggermente staccata dal fondo
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
                    // --- ICONA HOME PIÙ GRANDE (Modifica 2) ---
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        size: 45, // Ingrandita (le altre sono 35)
                        color: Color(0xFF347487),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person, size: 35, color: Color(0xFF333333)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.directions_car, size: 35, color: Color(0xFF333333)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings, size: 35, color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper per creare i bottoni uguali
  // --- TESTO CENTRATO (Modifica 1) ---
  Widget _buildActionButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        alignment: Alignment.center, // Forza il testo al centro
        fixedSize: const Size(140, 50), // Diamo una dimensione fissa per uniformità
        padding: EdgeInsets.zero, // Rimuove padding extra che potrebbe spostare il testo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center, // Allineamento testo
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
    );
  }
}