import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nextdoorgym/screens/home_page/controller/home_provider.dart';
import 'package:nextdoorgym/screens/landing_pages/views/splashscreen.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: SplashScreen(),
          title: 'Nextdoor gym',
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
