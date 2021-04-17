import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'delivery_app/data/category_state.dart';
import 'delivery_app/screens/main_screen_delivery_food.dart';

import 'facebook_ui/data/local_providers.dart';
import 'facebook_ui/screens/screen_controller.dart';
import 'facebook_ui/theme/theme_state.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryState()),
        ChangeNotifierProvider(create: (_) => BottomBarState()),
        ChangeNotifierProvider(create: (_) => ScreensState()),
        ChangeNotifierProvider(create: (_) => ThemeState()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MainScreenDeliveryFood(),
                  ),
                ),
                child: const Text('Delivery App'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ScreenController(),
                  ),
                ),
                child: const Text('Facebook UI (Mao Lop)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
