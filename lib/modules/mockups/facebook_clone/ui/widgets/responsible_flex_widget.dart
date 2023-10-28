import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ResponsibleFlexWidget extends StatelessWidget {
  final List<Widget> children;

  const ResponsibleFlexWidget({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > largestWidth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
