import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Views/register_all_provider.dart';
import 'package:provider/provider.dart';
import 'App_Route/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: RegisterAllProvider.provider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routerConfig: AppRoute.router,
        // routerDelegate: AppRoute.router.routerDelegate,
        // routeInformationProvider: AppRoute.router.routeInformationProvider,
        // routeInformationParser: AppRoute.router.routeInformationParser,
      ),
    );
  }
}
