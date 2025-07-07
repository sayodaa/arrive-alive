import 'package:arrive_alive/core/constants/strings.dart';
import 'package:arrive_alive/core/routes/app_route.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/theme_data.dart';
import 'package:arrive_alive/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await initSupabase();
  runApp(const ArriveAliveApp());
}

final SupabaseClient supabase = Supabase.instance.client;

class ArriveAliveApp extends StatelessWidget {
  const ArriveAliveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.onBordingScreen,
        theme: themeData,
      ),
    );
  }
}

Future<void> initSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Supabase.initialize(
      url: ConstantsStrings.supabaseUrl,
      anonKey: ConstantsStrings.supabaseKey,
      realtimeClientOptions: const RealtimeClientOptions(
        timeout: Duration(seconds: 5),
        logLevel: RealtimeLogLevel.warn,
      ),
    );
  } catch (e) {
    debugPrint('Error initializing Supabase: $e');
  }
}
