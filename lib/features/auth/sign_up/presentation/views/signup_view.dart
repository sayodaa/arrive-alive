import 'package:arrive_alive/core/customs/app_custom_text_field.dart';
import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful. Check your email to confirm.'),
            backgroundColor: Colors.green,
          ),
        );
        context.pushNamed(Routes.homeScreen);
      } else {
        throw Exception("Registration failed. Please try again.");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  AppCustomTextField(
                    labelText: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppCustomTextField(
                    labelText: 'Password',
                    icon: const Icon(Icons.lock_outlined),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Sign Up',
                          onPressed: signUp,
                        ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: AppStyles.font14W100,
                      ),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Text(
                          ' Sign In',
                          style: AppStyles.font14W100.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
