import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/service_repository.dart';
import 'viewmodels/booking_view_model.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/service_view_model.dart';

void main() {
  final repository = ServiceRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(repository),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceViewModel(repository),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingViewModel(),
        ),
      ],
      child: const FixItFlowApp(),
    ),
  );
}

class FixItFlowApp extends StatelessWidget {
  const FixItFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FixItFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}