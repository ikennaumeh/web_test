import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';
import 'package:web_test/generated/l10n.dart';
import 'package:web_test/views/locations.dart/projects_location.dart';
import 'package:web_test/views/locations.dart/task_details_location.dart';
import 'package:web_test/views/locations.dart/task_location.dart';
import 'package:web_test/views/locations.dart/teams_location.dart';
import 'package:web_test/views/widgets/menu_button.dart';
import 'package:web_test/views/widgets/task_button.dart';

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



class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          padding: const EdgeInsets.all(10.0),
          
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6,),
              Text(S.of(context).tasks, style: TextStyle(
              fontSize: 24.sf,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 3,),    
              const Divider(color: Color.fromARGB(255, 8, 79, 138),),
              const SizedBox(height: 3,), 
    
              TaskButton(
                beamer: _beamerKey, 
                uri: "/tasks/1",
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Tasks 1"),
                 Text(Jiffy(DateTime.now()).format("yy/MM  hh:mm"))
               ]),
                ),
                TaskButton(
                beamer: _beamerKey, 
                uri: "/tasks/2",
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Tasks 2"),
                 Text(Jiffy(DateTime.now()).format("yy/MM  hh:mm"))
               ]),
                ),
                TaskButton(
                beamer: _beamerKey, 
                uri: "/tasks/3",
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Tasks 3"),
                 Text(Jiffy(DateTime.now()).format("yy/MM  hh:mm"))
               ]),
                ),
                TaskButton(
                beamer: _beamerKey, 
                uri: "/tasks/4",
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("Tasks 4"),
                 Text(Jiffy(DateTime.now()).format("yy/MM  hh:mm"))
               ]),
                ),            
    
              ],
          ),
        ),),
        const VerticalDivider(color: Colors.grey,),
       (context.currentBeamLocation.state as BeamState).uri.path.isEmpty ?
            const Expanded(
              child: Center(
                child: Text('Empty'),
              ),
            ) :
            Expanded(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    locationBuilder: (routeInformation, _) =>
                        TaskDetailsLocation(routeInformation),
                  ),
                ),
              ),
      ],
    );
  }
}

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
           child:  Text('Teams', style: TextStyle(fontSize: 100),),
    );
  }
}

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(      
      child:  Text('Projects', style: TextStyle(fontSize: 100),),
    );
  }
}

class TaskDetailsScreen extends StatelessWidget {
  final int? taskId;
  const TaskDetailsScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(taskId.toString(), style: const TextStyle(fontSize: 100),));
  }
}


