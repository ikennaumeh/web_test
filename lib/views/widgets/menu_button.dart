import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key, 
    required this.beamer,
    required this.uri,
    required this.child,
  });

  final GlobalKey<BeamerState> beamer;
  final String uri;
  final Widget child;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
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
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 5.scale),
        decoration: BoxDecoration(
          color: path.contains(widget.uri)
            ? const Color.fromARGB(255, 228, 171, 87)
            : null,
            borderRadius: BorderRadius.circular(10)
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