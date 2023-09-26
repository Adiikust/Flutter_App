import 'package:flutter_app/Widget/network_controller.dart';
import 'package:provider/provider.dart';

class RegisterAllProvider {
  static get provider => [
        ChangeNotifierProvider<NetworkController>(
            lazy: true, create: (context) => NetworkController()),
      ];
}
