import 'package:comments_app/config/app_colors.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/features/home/view/helpers/comment_card.dart';
import 'package:comments_app/features/home/view_model/comments_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeViewModel>().getComments();
    });
    super.initState();
  }

  final w = SizeConfig.screenWidth;
  final h = SizeConfig.screenHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcSecondaryColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: const Text(
          "Comments",
          style: TextStyle(color: kcSecondaryColor),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(PageRoutes.profile);
              },
              icon: const Icon(
                Icons.person,
                color: kcSecondaryColor,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: w,
          height: h,
          child: Center(
            child: context.watch<HomeViewModel>().loading
                ? const CircularProgressIndicator()
                : context.watch<HomeViewModel>().comments.isEmpty
                    ? const Text("No data Found.")
                    : Consumer<HomeViewModel>(
                        builder: (context, viewModel, child) {
                        return ListView.builder(
                            itemCount: viewModel.comments.length,
                            itemBuilder: (context, index) => Center(
                                  child: CommentCard(
                                    commentData: viewModel.comments[index],
                                  ),
                                ));
                      }),
          ),
        ),
      ),
    );
  }
}
