import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/models/svg_asset.dart';
import 'package:masterclass_final_app/modules/profile/model/contact_details.dart';
import 'package:masterclass_final_app/modules/profile/model/profile_info.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/profile_info_card.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('ProfileInfoCard Widget Test |', () {
    final profileInfo = ProfileInfo(
      name: 'André Marcílio',
      bio: 'Cool boy',
      avatar: 'avatar_url',
      contactInfo: [
        ContactDetails(url: 'whats_url', iconAsset: SvgAsset.icWhats),
        ContactDetails(url: 'face_url', iconAsset: SvgAsset.icFacebook),
        ContactDetails(url: 'instagram_url', iconAsset: SvgAsset.icInstagram),
        ContactDetails(url: 'whats_url1', iconAsset: SvgAsset.icWhats),
      ],
    );

    testWidgets('should display the developer name', (tester) async {
      final view = ProfileInfoCard(profileInfo: profileInfo);

      await mockNetworkImages(() async => tester.pumpWidget(FlutterandoAppMock(view: view)));

      expect(find.text(profileInfo.name), findsOneWidget);
    });

    testWidgets('should display the developer bio', (tester) async {
      final view = ProfileInfoCard(profileInfo: profileInfo);

      await mockNetworkImages(() async => tester.pumpWidget(FlutterandoAppMock(view: view)));

      expect(find.text(profileInfo.bio), findsOneWidget);
    });

    testWidgets('should display all developer contact infos', (tester) async {
      final view = ProfileInfoCard(profileInfo: profileInfo);

      await mockNetworkImages(() async => tester.pumpWidget(FlutterandoAppMock(view: view)));

      for (final contact in profileInfo.contactInfo) {
        expect(find.byKey(ValueKey(contact.url + contact.iconAsset.path)), findsOneWidget);
      }
    });

    testWidgets('should display the the developer avatar', (tester) async {
      final view = ProfileInfoCard(profileInfo: profileInfo);

      await mockNetworkImages(() async => tester.pumpWidget(FlutterandoAppMock(view: view)));

      expect(find.byKey(ValueKey(profileInfo.avatar)), findsOneWidget);
    });
  });
}
