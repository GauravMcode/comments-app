import 'package:comments_app/config/navigation.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/data/remote_cofig_service.dart';
import 'package:comments_app/features/authentication/view_model/auth_viewmodel.dart';
import 'package:comments_app/features/home/view_model/comments_viewmodel.dart';
import 'package:comments_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseRemoteConfigService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints, orientation);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthViewModel()),
            ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ],
          child: MaterialApp(
              initialRoute:
                  AuthRepository.checkLoginState()
                  ? PageRoutes.home
                  : PageRoutes.signUp,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                   fontFamily: 'Poppins'),
              onGenerateRoute: Navigation.onGenerateRoutes,
              color: Colors.white),
        );
      });
    });
  }
}
