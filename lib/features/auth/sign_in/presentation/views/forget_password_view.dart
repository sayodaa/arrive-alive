import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Forget Password',
                    style: AppStyles.font31W700,
                  ),
                ),
                Center(child: Image.asset(AppAssets.forgetPass1, height: 300)),
                const SizedBox(height: 20),
                Text(
                    'Enter Your Email Address',
                    style: AppStyles.font14W100.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 20),
                const AppCustomTextField(
                  labelText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 20),
                CustomButton(text: 'Send', onPressed: () {
                  context.pushNamed(Routes.vereficationCodeScreen);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}