import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 10),
            _buildSettingsSection(
              title: 'Preferences',
              options: [
                _buildSettingsOption(
                    Icons.lock, 'Privacy', 'Manage app privacy settings'),
                _buildSettingsOption(Icons.dark_mode, 'Dark Mode', 'Automatic',
                    hasSwitch: true),
                _buildSettingsOption(
                    Icons.info, 'About', 'Learn more about the app'),
                _buildSettingsOption(Icons.feedback, 'Send Feedback',
                    'Let us know your thoughts'),
              ],
            ),
            const SizedBox(height: 10),
            _buildSettingsSection(
              title: 'Account',
              options: [
                _buildSettingsOption(Icons.logout, 'Sign Out', ''),
                _buildSettingsOption(Icons.email, 'Change Email', ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
      {required String title, required List<Widget> options}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Column(children: options),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(IconData icon, String title, String subtitle,
      {bool hasSwitch = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black54))
          : null,
      trailing: hasSwitch
          ? Switch(value: false, onChanged: (val) {})
          : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
