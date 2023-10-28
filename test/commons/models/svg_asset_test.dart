import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/models/svg_asset.dart';

void main() {
  group('SvgAsset unit test |', () {
    test('Every SvgAsset enum value should end with .svg', () {
      for (final svg in SvgAsset.values) {
        expect(svg.path, endsWith('.svg'));
      }
    });
  });
}
