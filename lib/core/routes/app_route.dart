import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/features/about/presentation/views/about_view.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/change_password_view.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/complete_forget_password_view.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/create_email.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/forget_password_view.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/signin_view.dart';
import 'package:arrive_alive/features/auth/sign_in/presentation/views/verefication_code.dart';
import 'package:arrive_alive/features/auth/sign_up/presentation/views/signup_view.dart';
import 'package:arrive_alive/features/home/presentation/views/home_view.dart';
import 'package:arrive_alive/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:arrive_alive/features/profile/presentation/views/edit_change_password.dart';
import 'package:arrive_alive/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBordingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const SigninView());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) =>const SignupView());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.vereficationCodeScreen:
        return MaterialPageRoute(builder: (_) => const VereficationCodeView());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case Routes.createEmailScreen:
        return MaterialPageRoute(builder: (_) => const CreateEmail());
      case Routes.completeForgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CompleteForgetPasswordView(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.aboutScreen:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => const EditChangePasswordView(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${routeSettings.name}'),
                ),
              ),
        );
    }
  }
}
