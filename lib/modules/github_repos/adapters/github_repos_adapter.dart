import '../model/github_repo.dart';

abstract class GithubRepoAdapter {
  static GithubRepo fromMap(dynamic map) {
    return GithubRepo(
      id: map['id'] as int,
      url: map['svn_url'] as String,
      size: map['size'] as int,
      title: map['name'] as String,
      description: map['description'] ?? '',
    );
  }

  static List<GithubRepo> fromMapList(List maps) {
    return maps.map(GithubRepoAdapter.fromMap).toList();
  }
}
