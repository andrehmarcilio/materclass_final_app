import 'dart:async';

import 'package:url_launcher/url_launcher.dart' as launcher;

abstract interface class UrlLauncher {
  FutureOr<bool> launchUrl(String urlPath);
}

class UrlLauncherIMPL implements UrlLauncher {
  @override
  Future<bool> launchUrl(String urlPath) async {
    final url = Uri.parse(urlPath);
    return await launcher.launchUrl(url);
  }
}
