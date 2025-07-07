import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        await supabase.from('profiles').upsert({
          'id': response.user!.id,
          'email': email,
          'created_at': DateTime.now().toIso8601String(),
        });
        emit(AuthSuccess());
      } else {
        emit(const AuthFailure('Unknown error occurred'));
      }
    } on AuthException catch (e) {
      emit(AuthFailure(e.message));
    } catch (e) {
      emit(AuthFailure('Error: $e'));
    }
  }
}
