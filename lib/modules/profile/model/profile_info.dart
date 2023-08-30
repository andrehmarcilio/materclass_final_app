import 'contact_details.dart';

class ProfileInfo {
  final String bio;
  final String name;
  final String avatar;
  final List<ContactDetails> contactInfo;

  ProfileInfo({
    required this.bio,
    required this.name,
    required this.avatar,
    required this.contactInfo,
  });
}
