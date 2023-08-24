import '../../exercices/model/exercice.dart';

class Activity {
  final int id;
  final String title;
  final String repoUrl;
  final String iconPath;
  final String description;
  final List<Exercice> exercices;

  Activity({
    required this.id,
    required this.title,
    required this.repoUrl,
    required this.iconPath,
    required this.exercices,
    required this.description,
  });
}
