import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:arrive_alive/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class EditChangePasswordView extends StatelessWidget {
  const EditChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SettingsHeader(text: 'change password',),
          Image.asset(AppAssets.forgetPass1, height: 200),
          const AppCustomTextField(labelText: 'old password', icon: Icon(Icons.lock)),
          const AppCustomTextField(labelText: 'new password', icon: Icon(Icons.lock)),
          const AppCustomTextField(labelText: 'confirm password', icon: Icon(Icons.lock)),
          CustomButton(text: 'Change Password', onPressed: (){
            context.pop();
          })
      ]),
    );
  }
}
