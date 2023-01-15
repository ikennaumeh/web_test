import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';
import 'package:web_test/generated/l10n.dart';
import 'package:web_test/views/locations.dart/projects_location.dart';
import 'package:web_test/views/locations.dart/task_location.dart';
import 'package:web_test/views/locations.dart/teams_location.dart';
import 'package:web_test/views/widgets/menu_button.dart';

class SmallDesktopView extends ConsumerWidget {
  SmallDesktopView({super.key});

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
      
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 73, 109),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.scale,
                ),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/tasks',
                  child: Text(S.of(context).tasks, style: const TextStyle(color: Colors.white),),
                ),
                
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/projects',
                  child: Text(S.of(context).projects, style: const TextStyle(color: Colors.white),),
                  ),
                  
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/teams',
                  child: Text(S.of(context).teams, style: const TextStyle(color: Colors.white),),
                  ),
              ],
            ),
          ),
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            const Expanded(
              child:  Center(
                child: Text('Home'),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    transitionDelegate: const NoAnimationTransitionDelegate(),
                    locationBuilder: (routeInformation, _) =>
                        routeInformation.location!.contains('projects')
                            ? ProjectLocation(routeInformation)
                            : routeInformation.location!.contains('teams')
                            ? TeamsLocation(routeInformation) : TasksLocation(routeInformation),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}












