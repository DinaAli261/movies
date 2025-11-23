import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

class CastCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String role;

  const CastCard({
    required this.imgUrl,
    required this.role,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.012,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: size.height * 0.07,
                color: AppColors.grey,
                alignment: Alignment.center,
                child: Icon(Icons.photo, color: AppColors.white, size: 50),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: AppColors.grey,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                ),
              );
            },
          ),
          Column(
            children: [
              SizedBox(width: size.width * 0.01),
              Text(
                '${AppLocalizations.of(context)!.name}: $role',
                style: AppTextStyles.regular20White,
                textAlign: TextAlign.start,
              ),
              Text(
                '     ${AppLocalizations.of(context)!.character}: $name',
                style: AppTextStyles.regular20White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}