import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/bloc/home/bloc_home_view.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const _MyApp());
}

/// Main app widget
class _MyApp extends StatelessWidget {
  /// Constructor
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocHomeView(),
    );
  }
}
