import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/constants.dart';

class CalPager extends StatelessWidget {
  static const String routeName = 'cal_pager';

  const CalPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [

            ],
          ),
          (Supabase.instance.client.auth.currentUser != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Supabase.instance.client.auth.currentUser!.id),
                      TextButton(
                        onPressed: _logOut,
                        child: const Text("Log out"),
                      ),
                    ],
                  ),
                )
              : Container()),
        ],
      ),
    );
  }

  void _logOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
