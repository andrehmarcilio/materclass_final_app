import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import 'widgets/animated_expansion_tile.dart';
import 'widgets/animated_shape_exercice.dart';

class ImplicitAnimationExercisePage extends StatelessWidget {
  const ImplicitAnimationExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Animações implícitas',
            style: context.fonts.titleMedium?.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
          foregroundColor: context.colors.surface,
          leading: BackButton(color: context.colors.onPrimary),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Formas animadas'),
              Tab(text: 'Custom expansion tile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimatedShapeExercice(),
            AnimatedExpansionTile(),
          ],
        ),
      ),
    );
  }
}
