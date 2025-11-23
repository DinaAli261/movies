import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';

class CastCard extends StatelessWidget {
  final Widget img;
  final String name;
  final String role;

  const CastCard({
    required this.img,
    required this.role,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.025,
        vertical: size.height * 0.012,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          img,
          Text(
            '${AppLocalizations.of(context)!.name}: BLANK',
            style: AppTextStyles.regular20White,
          ),
          Text(
            '${AppLocalizations.of(context)!.character}: BLANK',
            style: AppTextStyles.regular20White,
          ),
        ],
      ),
    );
  }
}