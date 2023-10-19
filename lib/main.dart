import 'package:flutter/material.dart';
import 'package:flutter_go_router_bottom_nav_example/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (_) => 'BottomNav',
      debugShowCheckedModeBanner: false,
      routerDelegate: router.appRouter.routerDelegate,
      routeInformationParser: router.appRouter.routeInformationParser,
      routeInformationProvider: router.appRouter.routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        //useMaterial3: true,
      ),
      builder: (context, child) {
        return SafeArea(child: child ?? const SizedBox.shrink());
      },
    );
  }
}
