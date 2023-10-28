import '../../utils/assets.dart' as assets;

enum SvgAsset {
  icGithub(assets.icGithub),
  icGlasses(assets.icGlasses),
  icMoon(assets.icMoon),
  icRunning(assets.icRunning),
  icToys(assets.icToys),
  icWhats(assets.icWhats),
  icGithubAlt(assets.icGithubAlt),
  icInstagram(assets.icInstagram),
  icFacebook(assets.icFacebook),
  icFlutter(assets.icFlutter),
  icDart(assets.icDart),
  icKotlin(assets.icKotlin),
  icAndroid(assets.icAndroid),
  icTarget(assets.icTarget),
  icPerson(assets.icPerson);

  final String path;

  const SvgAsset(this.path);
}
