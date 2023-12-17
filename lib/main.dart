import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/bloc/bloc_home_view.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

/// Main app widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocHomeView(),
    );
  }
}
