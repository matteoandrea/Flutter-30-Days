import 'package:day_5/post_view.dart';
import 'package:day_5/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsBloc>(
        create: (context) => PostsBloc()..add(LoadPostsEvent()),
        child: const PostView(),
      ),
    );
  }
}
