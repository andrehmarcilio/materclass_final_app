import 'package:flutter/material.dart';

import 'activities_router_delegate.dart';

class ActivitiesRouter extends StatefulWidget {
  const ActivitiesRouter({super.key});

  @override
  State<ActivitiesRouter> createState() => _ActivitiesRouterState();
}

class _ActivitiesRouterState extends State<ActivitiesRouter> {
  final routerDelegate = ActivitiesRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: routerDelegate,
    );
  }
}
