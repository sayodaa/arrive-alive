import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CompleteForgetPasswordView extends StatelessWidget {
  const CompleteForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Arrive Alive',
                  style: AppStyles.font31W700.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              Center(child: Image.asset(AppAssets.signUp, height: 300)),
              const AppCustomTextField(
                labelText: 'first name',
                icon: Icon(Icons.person),
              ),
              const AppCustomTextField(
                labelText: 'last name',
                icon: Icon(Icons.person),
              ),
              const AppCustomTextField(
                labelText: 'phone number',
                icon: Icon(Icons.call),
              ),
              CustomButton(text: 'Sign In', onPressed: () {
                context.pushNamed(Routes.homeScreen);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
