import 'package:demo/firebase_options.dart';
import 'package:demo/providers/auth_provider.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            if (authProvider.user == null) {
              return const LoginScreen();
            }
            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
