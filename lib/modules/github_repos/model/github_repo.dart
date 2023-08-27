class GithubRepo {
  final int id;
  final int size;
  final String title;
  final String description;

  GithubRepo({
    required this.id,
    required this.size,
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return 'Repository(id: $id, size: $size, title: $title, description: $description)';
  }
}
