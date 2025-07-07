import 'package:arrive_alive/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpUser(String email, String password) async {
    try {
      final emailTrimmed = email.trim();
      debugPrint("📩 Signing up with: $emailTrimmed");

      final response = await supabase.auth.signUp(email: emailTrimmed, password: password);

      if (response.user != null) {
        debugPrint("✅ User signed up successfully: ${response.user!.email}");

        if (response.user!.emailConfirmedAt == null) {
          debugPrint("📩 Email confirmation required.");
          emit(const SignUpSuccess("Account created! Please confirm your email."));
          return; // لا تحاول تسجيل الدخول قبل التفعيل
        }

        final loginResponse = await supabase.auth.signInWithPassword(email: emailTrimmed, password: password);
        if (loginResponse.user != null) {
          debugPrint("🔑 Login Successful! Navigating to home screen...");
          emit(const SignUpSuccess("Account created and logged in successfully!"));
        } else {
          debugPrint("⚠️ Signup worked but login failed.");
          emit(const SignUpFailure("Signup succeeded but login failed. Try signing in manually."));
        }
      } else {
        debugPrint("❌ Signup failed, response does not contain a user.");
        emit(const SignUpFailure("Signup failed, please try again."));
      }
    } catch (e) {
      final errorMessage = e.toString();
      
      if (errorMessage.contains("email_not_confirmed")) {
        debugPrint("⚠️ Email not confirmed yet.");
        emit(const SignUpFailure("Email not confirmed. Please check your inbox."));
      } else if (errorMessage.contains("over_email_send_rate_limit")) {
        debugPrint("⚠️ Too many requests. Try again later.");
        emit(const SignUpFailure("Too many requests. Try again in a few seconds."));
      } else {
        debugPrint("❌ SignUp Error: $errorMessage");
        emit(SignUpFailure(errorMessage));
      }
    }
  }

  Future<void> resendConfirmationEmail(String email) async {
    try {
await supabase.auth.resend(type: OtpType.email, email: email);
      debugPrint("📩 Email confirmation link sent successfully.");
      emit(const SignUpSuccess("Confirmation email sent! Please check your inbox."));
    } catch (e) {
      debugPrint("❌ Resend Email Error: $e");
      emit(SignUpFailure(e.toString()));
    }
  }
}