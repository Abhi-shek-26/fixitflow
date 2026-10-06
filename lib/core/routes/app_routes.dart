import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/service_model.dart';
import '../../views/booking/booking_screen.dart';
import '../../views/confirmation/confirmation_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/profile/profile_screen.dart';
import '../../views/service_details/service_details_screen.dart';
import '../../views/service_list/service_list_screen.dart';

class AppRouter {
  static const home = '/';
  static const serviceList = '/services';
  static const serviceDetails = '/service-details';
  static const booking = '/booking';

  static const confirmation = '/confirmation';
  static const profile = '/profile';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: serviceList,
        builder: (context, state) {
          final categoryId =
              state.uri.queryParameters['categoryId'] ?? '';

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
        builder: (context, state) {
          return const ConfirmationScreen();
        },
      ),
      // GoRoute(
      //   path: profile,
      //   builder: (context, state) {
      //     return const ProfileScreen();
      //   },
      // ),
    ],
  );
}