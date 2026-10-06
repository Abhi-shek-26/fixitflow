import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/service_model.dart';


class AppRouter {
  static const home = '/';
  static const serviceList = '/services';
  static const serviceDetails = '/service-details';
  static const booking = '/booking';
  static const confirmation = '/confirmation';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: serviceList,
        builder: (context, state) {
          final categoryId = state.uri.queryParameters['categoryId'] ?? '';
          final categoryName =
              state.uri.queryParameters['categoryName'] ?? 'Services';

          return ServiceListScreen(
            categoryId: categoryId,
            categoryName: categoryName,
          );
        },
      ),
      GoRoute(
        path: serviceDetails,
        builder: (context, state) {
          final service = state.extra as ServiceModel;

          return ServiceDetailsScreen(
            service: service,
          );
        },
      ),
      GoRoute(
        path: booking,
        builder: (context, state) {
          final service = state.extra as ServiceModel;

          return BookingScreen(
            service: service,
          );
        },
      ),
      GoRoute(
        path: confirmation,
        builder: (context, state) => const ConfirmationScreen(),
      ),
    ],
  );
}