import 'package:flutter/material.dart';

class ShadowedContainer extends StatelessWidget {
  final Widget child;

  const ShadowedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(
              Theme.of(context).primaryColor.withAlpha(100),
              Colors.white,
            ),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
