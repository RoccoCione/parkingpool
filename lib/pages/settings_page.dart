import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TITOLO
        const Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 40),
          child: Center(
            child: Text(
              'Impostazioni',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),

        // LISTA OPZIONI
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              // Notifiche
              _buildSettingRow(
                icon: Icons.notifications_none_outlined,
                text: "Notifiche",
                trailing: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _notificationsEnabled,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade300,
                    trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                    onChanged: (val) => setState(() => _notificationsEnabled = val),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Modalità Oscura
              _buildSettingRow(
                icon: Icons.nightlight_round_outlined,
                text: "Modalità oscura",
                isBeta: true,
                trailing: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _darkModeEnabled,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade300,
                    trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                    onChanged: (val) => setState(() => _darkModeEnabled = val),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Informazioni
              _buildSettingRow(
                icon: Icons.help_outline,
                text: "Informazioni",
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
                ),
              ),

              const SizedBox(height: 30),

              // Logout
              _buildSettingRow(
                icon: Icons.logout,
                text: "Logout",
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.grey, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingRow({
    required IconData icon,
    required String text,
    required Widget trailing,
    bool isBeta = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 35, color: const Color(0xFF333333)),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              if (isBeta) ...[
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: const Text(
                    "Beta",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
        trailing,
      ],
    );
  }
}