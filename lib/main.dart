import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nextdoorgym/screens/auth_page/controller/auth_provider.dart';
import 'package:nextdoorgym/screens/home_page/controller/home_provider.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splashscreen.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/services/api_services.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:nextdoorgym/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox(kUserDataBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiService>(
          create: (_) => ApiService(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider<SetupAccountProvider>(
          create: (_) => SetupAccountProvider(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            color: Colors.white,
            scaffoldMessengerKey: Utils.rootScaffoldMessengerKey,
            home: const SplashScreen(),
            title: 'Nextdoor gym',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
