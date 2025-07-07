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
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  SigninViewState createState() => SigninViewState();
}

class SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final supabase = Supabase.instance.client;
  Future<void> _signInUser() async {
    setState(() => _isLoading = true);
    try {
      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
        context.pushNamed(Routes.homeScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid credentials. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on AuthException catch (e) {
      String errorMessage = e.message;
      if (e.message.contains('user not found')) {
        errorMessage = 'User not found. Please sign up.';
      } else if (e.message.contains('invalid password')) {
        errorMessage = 'Invalid password. Please try again.';
    }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Center(child: Image.asset(AppAssets.signIn, height: 300)),
                  AppCustomTextField(
                    labelText: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppCustomTextField(
                    labelText: 'Password',
                    icon: const Icon(Icons.lock_outlined),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Sign In',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signInUser();
                            }
                          },
                        ),
                  GestureDetector(
                    onTap: () =>
                        context.pushNamed(Routes.forgetPasswordScreen),
                    child: const Text(
                      'Forgot Password?',
                      style: AppStyles.font14W100,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SignLine(),
                  const SizedBox(height: 20),
                  const SignIcons(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: AppStyles.font14W100,
                      ),
                      GestureDetector(
                        onTap: () => context.pushNamed(Routes.signupScreen),
                        child: Text(
                          ' Sign Up',
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
