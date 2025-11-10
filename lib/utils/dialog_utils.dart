import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

class DialogUtils {
  static void showMessage({
    required BuildContext context,
    String? title,
    required String message,
    String? posName,
    Function? posAction,
    Function? negAction,
    String? negName,
  }) {
    List<Widget>? action = [];
    if (posAction != null) {
      action.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            Navigator.pop(context);
            posAction.call();
          },
          child: Text(posName ?? '', style: AppTextStyles.regular14Yellow),
        ),
      );
    }

    if (negAction != null) {
      action.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            Navigator.pop(context);
            negAction.call();
          },
          child: Text(negName ?? '', style: AppTextStyles.regular14Yellow),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.black,
        title: Text(title ?? '', style: AppTextStyles.regular16Yellow),
        content: Text(message, style: AppTextStyles.regular14Yellow),
        actions: action,
      ),
    );
  }
}
