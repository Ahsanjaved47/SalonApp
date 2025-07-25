import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _buildSettingsTile(title: 'Account Info', onTap: () {}),
            _divider(),
            _buildSettingsTile(title: 'Language', onTap: () {}),
            _divider(),
            _buildDarkModeToggle(),
            _divider(),
            const SizedBox(height: 20),
            _buildSimpleText('Help Center'),
            _buildSimpleText('Privacy Policy'),
            _buildSimpleText('Recommendations'),
            const SizedBox(height: 30),


            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Sign-out',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Colors.white12),
    );
  }

  Widget _buildSettingsTile({required String title, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white70),
    );
  }

  Widget _buildDarkModeToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Dark Mode',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Switch(
            value: true,
            onChanged: null,
            activeColor: Colors.white,
            activeTrackColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildSimpleText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
