import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/svg_asset.dart';

class SvgWidget extends StatelessWidget {
  final SvgAsset svgAsset;
  final double? width;
  final double? height;
  final ColorFilter? colorFilter;

  const SvgWidget({
    required this.svgAsset,
    this.width,
    this.height,
    this.colorFilter,
    super.key,
  });

  SvgWidget.withColor({
    required this.svgAsset,
    required Color color,
    this.width,
    this.height,
    super.key,
  }) : colorFilter = ColorFilter.mode(color, BlendMode.srcIn);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAsset.path,
      width: width,
      height: height,
      colorFilter: colorFilter,
    );
  }
}
