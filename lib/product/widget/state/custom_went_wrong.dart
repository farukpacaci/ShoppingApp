import 'package:flutter/material.dart';

/// Custom error widget
class CustomWentWrong extends StatelessWidget {
  /// Constructor
  const CustomWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Something went wrong!'),
    );
  }
}
