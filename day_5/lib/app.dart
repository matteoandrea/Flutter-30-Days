import 'package:day_5/app_navigator.dart';
import 'package:day_5/nav_bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostsBloc()..add(LoadPostsEvent()),
          ),
          BlocProvider(
            create: (context) => NavCubit(),
          )
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
