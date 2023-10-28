sealed class Exercice {
  final int id;
  final String title;

  Exercice({
    required this.id,
    required this.title,
  });
}

class FlutterExercice extends Exercice {
  final String routePath;

  FlutterExercice({
    required super.id,
    required super.title,
    required this.routePath,
  });
}

class DartExercice extends Exercice {
  final String githubUrl;

  DartExercice({
    required super.id,
    required super.title,
    required this.githubUrl,
  });
}
