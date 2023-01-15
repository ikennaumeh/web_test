import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/desktop/project_screen.dart';

class ProjectLocation extends BeamLocation<BeamState> {
  ProjectLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/project/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('projects'),
          title: 'Projects',
          child: ProjectScreen(),
        )
      ];
}