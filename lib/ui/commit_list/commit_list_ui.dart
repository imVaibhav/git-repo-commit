import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commits/ui/commit_list/bloc/commit_list_bloc.dart';
import 'package:git_commits/ui/commit_list/bloc/commit_list_repo.dart';
import 'package:git_commits/ui/repo_card/repo_card_ui.dart';

class CommitsList extends StatefulWidget {
  const CommitsList({Key key}) : super(key: key);

  @override
  State<CommitsList> createState() => _CommitsListState();
}

class _CommitsListState extends State<CommitsList> {
  CommitListRepo _repo;
  CommitListBloc _bloc;
  @override
  void initState() {
    _repo = CommitListRepo();
    _bloc = CommitListBloc(_repo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc..add(fetchCommits()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Repos'),
        ),
        body: Column(
          children: [
            BlocConsumer<CommitListBloc, CommitListState>(
                builder: (context, state) {
                  if (state is LoadingCommits)
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  else if (state is ShowCommits) {
                    if (state.list.isEmpty)
                      return Expanded(
                        child: Center(
                          child: Text('Nothing In Here'),
                        ),
                      );
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GitRepoDetailsCard(state.list[index]);
                      },
                      itemCount: state.list.length,
                    ));
                  } else
                    return Expanded(
                      child: Center(
                        child: Text('Somthing went wrong!'),
                      ),
                    );
                },
                listener: (context, state) {}),
          ],
        ),
      ),
    );
  }
}
