import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/home/home_wrapper.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('home-${DateTime.now()}'),
          title: 'Home',
          child: const HomeWrapper(),
        )
      ];
}