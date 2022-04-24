import 'package:day_5/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadPostsSucessState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostsBloc>(context)..add(RefreshPostsEvent()),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(title: Text(state.posts[index].title)),
                  );
                }),
              ),
            );
          } else if (state is LoadPostsFailState) {
            return Center(
              child: Text("Error: {$state.error"),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
