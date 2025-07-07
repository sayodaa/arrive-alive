import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/widgets/sign_icons.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/widgets/sign_line.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreateEmail extends StatelessWidget {
  const CreateEmail({super.key});

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
                labelText: 'Email',
                icon: Icon(Icons.email_outlined),
              ),
              const AppCustomTextField(
                labelText: 'Password',
                icon: Icon(Icons.lock_outlined),
              ),
                const AppCustomTextField(
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.lock_outlined),
                ),
              CustomButton(text: 'Next', onPressed: () {
                context.pushNamed(Routes.completeForgetPasswordScreen);
              }),
              const SignLine(),
              const SizedBox(height: 20),
              const SignIcons(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
