import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget _child;
  final void Function()? _onTap;

  const GradientContainer({
    required Widget child,
    void Function()? onTap,
    super.key,
  }) : _child = child,
       _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        // alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        padding: const EdgeInsets.only(left: 20),
        child: _child,
      ),
    );
  }
}
