import 'package:flutter/material.dart';
import 'package:movies/home/tabs/profile_tab/widget/custom_details.dart';
import 'package:movies/home/tabs/profile_tab/widget/custom_tap.dart';
import 'package:movies/providers/user_provider.dart';
import 'package:movies/providers/watch_list_provider.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../../model/account.dart';
import '../../../model/movies/movie_response.dart';
import '../../../providers/history_provider.dart';
import '../../../utils/app_routes.dart';
import '../home_tab/widget/movie_item.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var userProvider = Provider.of<UserProvider>(context);
    var watchListProvider = Provider.of<WatchListProvider>(
        context, listen: false);

    int avatarIndex = (userProvider.currentUser?.avaterId ?? 1) - 1;
    if (avatarIndex < 0 || avatarIndex >= Account.avatars.length) {
      avatarIndex = 0;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 0,
                top: height * 0.07,
                // right: width * 0.04,
                //left: width * 0.04,
              ),
              color: AppColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        Account.avatars[avatarIndex],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Consumer<WatchListProvider>(
                        builder: (context, watchListProvider, _) {
                          return CustomDetails(
                            text: 'Watch List',
                            num: '${watchListProvider.watchList.length}',
                          );
                        },
                      ),
                      Consumer<HistoryProvider>(
                        builder: (context, historyProvider, _) {
                          return CustomDetails(
                            text: 'History',
                            num: '${historyProvider.history.length}',
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    userProvider.currentUser?.name ?? '',
                    style: AppTextStyles.bold20White,
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                      right: width * 0.04,
                      left: width * 0.04,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                            text: 'Edit Profile',
                            backgroundColor: AppColors.yellow,
                            onPressed: () {
                              var user = userProvider.currentUser;
                              if (user == null) return;
                              Navigator.of(context).pushNamed(
                                AppRoutes.updateProfileRouteName,
                                arguments: {
                                  'name': user.name,
                                  'phone': user.phone,
                                  'avatarIndex': user.avaterId - 1,
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: CustomElevatedButton(
                            text: 'Exit',
                            textStyle: AppTextStyles.regular20White,
                            suffixIcon: Image.asset(
                              AppImages.exitIcon,
                              color: AppColors.white,
                            ),
                            backgroundColor: AppColors.red,
                            borderColor: AppColors.transparent,
                            hasSuffixIcon: true,
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.loginRouteName,
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: AppColors.yellow,
                          dividerColor: AppColors.transparent,
                          tabs: [
                            CustomTap(
                              image: AppImages.watchListIcon,
                              text: 'Watch List',
                            ),
                            CustomTap(
                              image: AppImages.historyIcon,
                              text: 'History',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.65,
                          width: double.infinity,
                          child: Container(
                            color: AppColors.black,
                            child: TabBarView(
                              children: [
                                // Watchlist Placeholder
                                Consumer<WatchListProvider>(
                                  builder: (context, WatchListProvider, _) {
                                    if (WatchListProvider.watchList.isEmpty) {
                                      return Center(
                                        child: Image.asset(AppImages.emptyIcon),
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.all(width * 0.02),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: height * 0.017,
                                        crossAxisSpacing: width * 0.04,
                                        childAspectRatio: 189 / 279,
                                      ),
                                      itemCount: WatchListProvider.watchList
                                          .length,
                                      itemBuilder: (context, index) {
                                        final wMovie =
                                        WatchListProvider.watchList[index];

                                        final WatchListAsMovie = Movie(
                                          id: wMovie.id,
                                          title: wMovie.title,
                                          titleEnglish: wMovie.title,
                                          year: 0,
                                          rating: 0,
                                          mediumCoverImage: wMovie.posterPath,
                                          largeCoverImage: wMovie.posterPath,
                                          genres: [],
                                          runtime: 0,
                                        );
                                        return MovieItem(
                                          index: index,
                                          movie: WatchListAsMovie,
                                          height: 0.24,
                                          width: 0.3395,
                                        );
                                      },
                                    );
                                  },
                                ),
                                // Center(child: Image.asset(AppImages.emptyIcon)),

                                Consumer<HistoryProvider>(
                                  builder: (context, historyProvider, _) {
                                    if (historyProvider.history.isEmpty) {
                                      return Center(
                                        child: Image.asset(AppImages.emptyIcon),
                                      );
                                    }

                                    return GridView.builder(
                                      padding: EdgeInsets.all(width * 0.02),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: height * 0.017,
                                            crossAxisSpacing: width * 0.04,
                                            childAspectRatio: 189 / 279,
                                          ),
                                      itemCount: historyProvider.history.length,
                                      itemBuilder: (context, index) {
                                        final hMovie =
                                            historyProvider.history[index];

                                        final historyAsMovie = Movie(
                                          id: hMovie.id,
                                          title: hMovie.title,
                                          titleEnglish: hMovie.title,
                                          year: 0,
                                          rating: 0,
                                          mediumCoverImage: hMovie.posterPath,
                                          largeCoverImage: hMovie.posterPath,
                                          genres: [],
                                          runtime: 0,
                                        );
                                        return MovieItem(
                                          index: index,
                                          movie: historyAsMovie,
                                          height: 0.24,
                                          width: 0.3395,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
