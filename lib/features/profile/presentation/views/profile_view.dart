import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SettingsHeader(text: 'Account Settings',),
          const ProfileImage(),
          const AppCustomTextField(labelText: 'first name', icon: Icon(Icons.person)),
          const AppCustomTextField(labelText: 'last name', icon: Icon(Icons.person)),
          const AppCustomTextField(labelText: 'Your Phone Number', icon: Icon(Icons.lock)),
          const AppCustomTextField(labelText: 'email', icon: Icon(Icons.email)),
          CustomButton(text: 'Change Password', onPressed: (){
            context.pushNamed(Routes.changePassword);
          })
      ]),
    );
  }
}


class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.profile),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
            const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),)
          ],
          ),
        ],
      ),
    );
  }
}