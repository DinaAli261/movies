import 'package:flutter/material.dart';
import 'package:movies/model/account.dart';
import 'package:movies/update_profile/widget/avatars_bottom_sheet.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_button.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';
import 'package:provider/provider.dart';

import '../api/api_manager.dart';
import '../helpers/token_manager.dart';
import '../l10n/app_localizations.dart';
import '../model/my_user.dart';
import '../providers/user_provider.dart';
import '../utils/dialog_utils.dart';

class UpdateProfile extends StatefulWidget {
  final String name;
  final String phone;
  final int avatarIndex;

  const UpdateProfile({
    super.key,
    required this.name,
    required this.phone,
    required this.avatarIndex,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    AvatarsBottomSheet.selectedIndex = widget.avatarIndex;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    int avatarIndex = AvatarsBottomSheet.selectedIndex;
    if (avatarIndex < 0 || avatarIndex >= Account.avatars.length) {
      avatarIndex = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.pick_avatar,
          style: AppTextStyles.regular16Yellow,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.037 * width,
          vertical: 0.025 * height,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  showAvatarsBottomSheet(height);
                },
                child: Image.asset(
                  Account.avatars[avatarIndex],
                  width: 0.35 * width,
                  height: 0.16 * height,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: height * 0.037),
              CustomTextFormField(
                controller: nameController,
                hintText: AppLocalizations.of(context)!.profile_name,
                hintStyle: AppTextStyles.regular20White,
                prefixIcon: ImageIcon(
                  AssetImage(AppImages.updateNameIcon),
                  color: AppColors.white,
                ),
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_your_name;
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: phoneController,
                hintText: AppLocalizations.of(context)!.phone,
                hintStyle: AppTextStyles.regular20White,
                prefixIcon: ImageIcon(
                  AssetImage(AppImages.phoneIcon),
                  color: AppColors.white,
                ),
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return AppLocalizations.of(
                      context,
                    )!.please_enter_your_phone_number;
                  }
                  return null;
                },
              ),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: CustomTextButton(
                  text: AppLocalizations.of(context)!.reset_password,
                  textStyle: AppTextStyles.regular20White,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.resetPasswordRouteName);
                  },
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.delete_account,
                textStyle: AppTextStyles.regular20White,
                onPressed: () {
                  deleteAccount();
                },
                backgroundColor: AppColors.red,
                borderColor: AppColors.red,
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.update_account,
                textStyle: AppTextStyles.regular20Black,
                onPressed: () {
                  updateAccount();
                },
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  showAvatarsBottomSheet(double height) {
    showModalBottomSheet(
      backgroundColor: AppColors.transparent,
      constraints: BoxConstraints(maxHeight: height * 0.45),
      context: context,
      builder: (context) => AvatarsBottomSheet(
        onAvatarSelected: (index) {
          AvatarsBottomSheet.selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  void updateAccount() async {
    if (_formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, message: "Updating...");
      final token = await UserManager.getToken();
      if (token == null) {
        DialogUtils.showMessage(
          context: context,
          title: "Error",
          message: "Token not found, please login again",
          posName: "OK",
        );
        return;
      }
      final response = await ApiManager.updateProfile(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        avaterId: AvatarsBottomSheet.selectedIndex + 1,
        token: token,
      );

      if (response.message != null) {
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(
          MyUser(
            id: userProvider.currentUser!.id,
            name: nameController.text.trim(),
            email: userProvider.currentUser!.email,
            phone: userProvider.currentUser!.phone,
            avaterId: AvatarsBottomSheet.selectedIndex + 1,
          ),
        );
        Navigator.pop(context);

        DialogUtils.showMessage(
          context: context,
          title: "Success",
          message: response.message ?? "Profile updated successfully",
          posName: "OK",
        );
      } else {
        DialogUtils.showMessage(
          context: context,
          title: "Error",
          message: "Failed to update profile",
          posName: "OK",
        );
      }
    }
  }

  void deleteAccount() async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete your account?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text("Delete"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm) {
      DialogUtils.showLoading(context: context, message: "Deleting account...");

      final token = await UserManager.getToken();
      final response = await ApiManager.deleteProfile(token: token!);

      DialogUtils.hideLoading(context);

      if (response.message != null) {
        await UserManager.clearUserData();
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.loginRouteName,
          (route) => false,
        );

        DialogUtils.showMessage(
          context: context,
          title: "Deleted",
          message: response.message!,
          posName: "OK",
        );
      } else {
        DialogUtils.showMessage(
          context: context,
          title: "Error",
          message: "Failed to delete account",
          posName: "OK",
        );
      }
    }
  }
}