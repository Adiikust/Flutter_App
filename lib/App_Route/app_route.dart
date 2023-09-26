import 'package:flutter/material.dart';
import 'package:flutter_app/Views/adaptive_screen.dart';
import 'package:flutter_app/Views/extension_screen.dart';
import 'package:flutter_app/Views/google_pay_and_apple_pay_screen.dart';
import 'package:flutter_app/Views/network_connectivity_screen.dart';
import 'package:flutter_app/Views/voice_to_text_screen.dart';
import 'package:flutter_app/Views/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return WelcomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'voiceTOTextScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const VoiceTOTextScreen();
            },
          ),
          GoRoute(
            path: 'networkConnectivityScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const NetworkConnectivityScreen();
            },
          ),
          GoRoute(
            path: 'paySampleApp',
            builder: (BuildContext context, GoRouterState state) {
              return const PaySampleApp();
            },
          ),
          GoRoute(
            path: 'extensionScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const ExtensionScreen();
            },
          ),
          GoRoute(
            path: 'adaptiveScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const AdaptiveScreen();
            },
          ),
        ],
      ),
    ],
  );
}
