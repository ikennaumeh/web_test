import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_test/core/app_model.dart';
import 'package:web_test/views/locations.dart/home_location.dart';
import 'generated/l10n.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale locale = ref.watch(appModelProvider);

    return MaterialApp.router(
      title: 'Task test',
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}


