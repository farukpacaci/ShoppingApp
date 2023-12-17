import 'package:flutter/material.dart';

/// Custom error widget
class CustomError extends StatelessWidget {
  /// Constructor
  const CustomError({required this.message, super.key});

  /// Message to display for error
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
