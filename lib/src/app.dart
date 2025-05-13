import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMMS Member',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        ...appRoutes,
      },
    );
  }
}
