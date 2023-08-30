import '../../../commons/models/svg_asset.dart';

class Technology {
  final int id;
  final String name;
  final SvgAsset icon;

  Technology({
    required this.id,
    required this.name,
    required this.icon,
  });

  @override
  String toString() => 'Technology(id: $id, name: $name, icon: $icon)';
}
