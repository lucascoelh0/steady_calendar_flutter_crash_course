import 'package:crash_couse_advanced/components/sc_list_container.dart';
import 'package:crash_couse_advanced/components/sc_list_divider.dart';
import 'package:crash_couse_advanced/components/sc_list_tile.dart';
import 'package:crash_couse_advanced/components/sc_nav_bar.dart';
import 'package:crash_couse_advanced/config/constants.dart';
import 'package:crash_couse_advanced/util/alert.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  static const String routeName = '/menu';

  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCNavBar(
      title: '',
      isModal: true,
      child: SCListContainer(
        [
          SCListTile('About',
              onTap: () => _attemptLaunchUrl(context, appWebsite)),
          const SCListDivider(),
          SCListTile('Submit Feedback',
              onTap: () =>
                  _attemptLaunchUrl(context, 'mailto:$appSupportEmail')),
          const SCListDivider(),
          SCListTile(
            'Rate Steady Calendar',
            onTap: () => _attemptLaunchUrl(context, _rateUrl(context)),
          ),
          const SCListDivider(),
          SCListTile('Log Out', onTap: () => _logout(context)),
        ],
      ),
    );
  }

  _logout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
  }

  String _rateUrl(BuildContext context) {
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    return (ios ? appRatingURLiOS : appRatingURLAndroid);
  }

  void _attemptLaunchUrl(BuildContext context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      showAlert(context, '', 'Could not launch $url');
    }
  }
}
