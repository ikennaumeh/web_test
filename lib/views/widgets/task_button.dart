import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';

class TaskButton extends StatefulWidget {
  const TaskButton({super.key, 
    required this.beamer,
    required this.uri,
    required this.child,
  });

  final GlobalKey<BeamerState> beamer;
  final String uri;
  final Widget child;

  @override
  _TaskButtonState createState() => _TaskButtonState();
}

class _TaskButtonState extends State<TaskButton> {
  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
  }

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;

    return GestureDetector(
      onTap: () =>
          widget.beamer.currentState?.routerDelegate.beamToNamed(widget.uri),
      child: Container(
               width: double.maxFinite,
               padding: const EdgeInsets.all(10),
               margin: EdgeInsets.only(bottom: 10.scale),
               decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),

               ),
               child: widget.child,
              ),
      
    );
  }

  @override
  void dispose() {
    widget.beamer.currentState?.routerDelegate
        .removeListener(_setStateListener);
    super.dispose();
  }
}