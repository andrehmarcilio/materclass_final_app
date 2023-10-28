import '../../../commons/models/svg_asset.dart';
import '../model/contact_details.dart';
import '../model/developer_profile.dart';
import '../model/profile_info.dart';
import '../model/skill.dart';
import '../model/technology.dart';

final profileData = DeveloperProfile(
  id: 1,
  profileInfo: ProfileInfo(
    bio: 'Desenvolvedor Flutter com 2 anos de experiência, harmonizando paixões'
        ' pela tecnologia e música. Transformo ideias criativas em soluções fluidas.',
    name: 'André Marcílio',
    avatar: 'https://avatars.githubusercontent.com/u/103319187?v=4',
    contactInfo: [
      ContactDetails(url: 'whats_url', iconAsset: SvgAsset.icWhats),
      ContactDetails(url: 'github_url', iconAsset: SvgAsset.icGithubAlt),
      ContactDetails(url: 'instagram_url', iconAsset: SvgAsset.icInstagram),
      ContactDetails(url: 'facebook_url', iconAsset: SvgAsset.icFacebook),
    ],
  ),
  skills: [
    Skill(id: 1, name: 'flutter', skillProficiency: .8),
    Skill(id: 2, name: 'dart', skillProficiency: .8),
    Skill(id: 3, name: 'javascript', skillProficiency: .6),
    Skill(id: 4, name: 'kotlin', skillProficiency: .7),
    Skill(id: 5, name: 'c++', skillProficiency: .5),
  ],
  favoriteTecnologies: [
    Technology(id: 1, name: 'Flutter', icon: SvgAsset.icFlutter),
    Technology(id: 2, name: 'Dart', icon: SvgAsset.icDart),
    Technology(id: 3, name: 'Kotlin', icon: SvgAsset.icKotlin),
    Technology(id: 4, name: 'Android', icon: SvgAsset.icAndroid),
  ],
);
