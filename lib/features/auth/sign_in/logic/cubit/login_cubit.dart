import 'package:arrive_alive/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> signInUser(String email, String password) async {
    try {
      emit(LoginLoading());

      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emit(LoginSuccess('تم تسجيل الدخول بنجاح ✅'));
      } else {
        emit(LoginFailure('فشل تسجيل الدخول ❌'));
      }
    } catch (e) {
      emit(LoginFailure('حدث خطأ أثناء تسجيل الدخول: $e'));
    }
  }
}
