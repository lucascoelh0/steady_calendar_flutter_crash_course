import 'package:cached_network_image/cached_network_image.dart';
import 'package:crash_couse_advanced/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Background extends StatelessWidget {
  final String? backgroundSlug;

  const Background(this.backgroundSlug, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl:
            "${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/$backgroundSlug",
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
