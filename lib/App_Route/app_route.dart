import 'package:flutter/material.dart';
import 'package:flutter_app/Views/Auth/google_Sign_in_screen.dart';
import 'package:flutter_app/Views/Chatting/home_screen.dart';
import 'package:flutter_app/Views/Splash/splash.dart';
import 'package:flutter_app/Views/Adaptive/adaptive_screen.dart';
import 'package:flutter_app/Views/Extension/extension_screen.dart';
import 'package:flutter_app/Views/Google_and_Apple_Pay/google_pay_and_apple_pay_screen.dart';
import 'package:flutter_app/Views/Network/network_connectivity_screen.dart';
import 'package:flutter_app/Views/Voice_To_Text/voice_to_text_screen.dart';
import 'package:flutter_app/Views/Welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'googleSignInScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const GoogleSignInScreen();
            },
          ),
          GoRoute(
            path: 'welcomeScreen',
            builder: (BuildContext context, GoRouterState state) {
              return WelcomeScreen();
            },
          ),
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
          GoRoute(
            path: 'homeScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}
