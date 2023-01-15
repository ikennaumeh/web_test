import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/desktop/team_screen.dart';

class TeamsLocation extends BeamLocation<BeamState> {
  TeamsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/teams/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('teams'),
          title: 'Teams',
          child: TeamsScreen(),
        )
      ];
}