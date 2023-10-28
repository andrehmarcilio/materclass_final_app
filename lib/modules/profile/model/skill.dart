class Skill {
  final int id;
  final String name;
  final double skillProficiency;

  Skill({
    required this.id,
    required this.name,
    required this.skillProficiency,
  });

  @override
  String toString() => 'Skill(id: $id, name: $name, skillProficiency: $skillProficiency)';
}
