import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SettingsHeader(text: 'settings',),
              Image.asset(AppAssets.forgetPass1, height: 200),
              const SizedBox(height: 20),
              const SettingsOptions(),
            ],
          ),
        ),
      ),
    );
  }
}


class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOption(context, 'Profile', Icons.person),
        _buildOption(context, 'About', Icons.info),
        _buildOption(context, 'Sign Out', Icons.logout),
        _buildOption(context, 'General', Icons.settings),
      ],
    );
  }

  Widget _buildOption(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 1.0),
      child: Container(
        color: const Color.fromARGB(255, 207, 199, 176),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: () {
            if (title == 'Profile') {
              Navigator.pushNamed(context, Routes.profileScreen);
            }else if (title == 'About') {
              Navigator.pushNamed(context, Routes.aboutScreen);
            }else if (title == 'Sign Out') {
              Navigator.pushNamed(context, Routes.loginScreen);
            }else if (title == 'General') {
              Navigator.pushNamed(context, Routes.settingsScreen);
            }
          },
        ),
      ),
    );
  }
}
