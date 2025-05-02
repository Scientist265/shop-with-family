import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // ignore: deprecated_member_use
  FirebaseDynamicLinks.instance.onLink.listen((pendingLink) {
    final uri = pendingLink.link;
    if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'session') {
      final sessionId = uri.pathSegments[1];
      navigatorKey.currentState?.pushNamed('/session/$sessionId');
    }
  });
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: App()));
}
