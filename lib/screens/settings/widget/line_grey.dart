import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';

class LenGrey extends StatelessWidget {
  const LenGrey({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (1.5 / 852) * height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
        ),
      ),
    );
  }
}
