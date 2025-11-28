import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = const Color(0xFF333333);

    return Stack(
      children: [
        // TITOLO + MENU
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Mappa dei parcheggi',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black),
                  onSelected: (String result) {},
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(value: '1', child: Text('Campus di Fisciano')),
                    const PopupMenuItem<String>(value: '2', child: Text('Sede di Baronissi')),
                    const PopupMenuItem<String>(value: '2', child: Text('Sede di Avellino')),
                  ],
                ),
              ],
            ),
          ),
        ),

        // BOTTONI ACCEDI/ESCO
        Positioned(
          bottom: 0,
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
      ],
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        fixedSize: const Size(140, 50),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}