import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop With Friends')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(const CreateSessionRoute()),
              child: const Text('Create New Session'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.router.push(const JoinSessionRoute()),
              child: const Text('Join Existing Session'),
            ),
          ],
        ),
      ),
    );
  }
}
