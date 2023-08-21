class Activity {
  final int id;
  final String title;
  final String repoUrl;
  final String iconPath;
  final int exercicesCount;
  final String description;

  Activity({
    required this.id,
    required this.title,
    required this.repoUrl,
    required this.iconPath,
    required this.description,
    required this.exercicesCount,
  });
}
