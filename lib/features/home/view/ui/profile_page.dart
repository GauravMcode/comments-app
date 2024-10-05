import 'package:comments_app/common/widgets/custom_button.dart';
import 'package:comments_app/config/app_colors.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeConfig.screenWidth!;
    final h = SizeConfig.screenHeight!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        foregroundColor: kcSecondaryColor,
        title: const Text(
          "Profile",
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: w,
        height: h,
        child: Center(
          child: Builder(builder: (context) {
            final user = AuthRepository.getUserDetails();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: w * 0.6,
                  child: Card(
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.person_pin_rounded,
                            size: 80,
                            color: kcPrimaryColor,
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Text(
                            user?.displayName?.toUpperCase() ?? "",
                            style: const TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Text(
                            user?.email ?? "",
                            style: const TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.6,
                  child: CustomButton(
                    text: "Logout",
                    onPressed: () {
                      AuthRepository.logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PageRoutes.signUp,
                          ModalRoute.withName(PageRoutes.signUp));
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
