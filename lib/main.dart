import 'package:flutter/material.dart';
import 'package:nextdoorgym/helper/routing_helper/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiProvider(
      providers: [],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        title: 'Nextdoor gym',
      ),
    );
  }
}
