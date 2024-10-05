import 'package:comments_app/config/app_colors.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/main.dart';
import 'package:comments_app/features/home_page/view/helpers/comment_card.dart';
import 'package:comments_app/features/home_page/view_model/comments_viewmodel.dart';
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

  @override
  Widget build(BuildContext context) {
    final w = SizeConfig.screenWidth;
    final h = SizeConfig.screenHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: const Text(
          "Comments",
          style: TextStyle(color: kcWhite),
        ),
      ),
      body: SizedBox(
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
                          itemBuilder: (context, index) => CommentCard(
                                commentData: viewModel.comments[index],
                              ));
                    }),
        ),
      ),
    );
  }
}
