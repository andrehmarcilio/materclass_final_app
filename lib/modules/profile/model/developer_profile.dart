import 'profile_info.dart';
import 'skill.dart';
import 'technology.dart';

class DeveloperProfile {
  final int id;
  final List<Skill> skills;
  final ProfileInfo profileInfo;
  final List<Technology> favoriteTecnologies;

  DeveloperProfile({
    required this.id,
    required this.skills,
    required this.profileInfo,
    required this.favoriteTecnologies,
  });
}
