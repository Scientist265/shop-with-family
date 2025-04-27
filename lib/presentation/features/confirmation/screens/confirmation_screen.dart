// lib/presentation/features/confirmation/screens/confirmation_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';

@RoutePage()
class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thanks for shopping!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.router.replaceAll([const HomeRoute()]),
              child: const Text('Return Home'),
            ),
          ],
        ),
      ),
    );
  }
}
