import 'package:day_5/nav_bloc.dart';
import 'package:day_5/post_detail_view.dart';
import 'package:day_5/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(
      builder: (context, post) {
        return Navigator(
          pages: [
            const MaterialPage(child: PostView()),
            if (post != null)
              MaterialPage(
                  child: PostDetailView(
                post: post,
              ))
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPostView();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
