import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/Remote_Config/remote_confige_key.dart';
import 'package:flutter_app/Controller/Remote_Config/remote_configs_service_provider.dart';
import 'package:flutter_app/Views/register_all_provider.dart';
import 'package:provider/provider.dart';
import 'App_Route/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await RemoteConfigsServiceProvider.create();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: RegisterAllProvider.provider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: firebaseRemoteConfig.getString(RemoteConfigKeys.appTitle),
        theme: ThemeData(
          primarySwatch: RemoteConfigKeys.getColorByName(
              firebaseRemoteConfig.getString(RemoteConfigKeys.primaryColor)),
        ),
        routerConfig: AppRoute.router,
        // routerDelegate: AppRoute.router.routerDelegate,
        // routeInformationProvider: AppRoute.router.routeInformationProvider,
        // routeInformationParser: AppRoute.router.routeInformationParser,
      ),
    );
  }
}
