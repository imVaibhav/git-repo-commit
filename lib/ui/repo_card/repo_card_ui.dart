import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commits/models/git_repo_model.dart';
import 'package:git_commits/ui/repo_card/bloc/repo_card_bloc.dart';

import 'bloc/repo_card_repo.dart';

class GitRepoDetailsCard extends StatefulWidget {
  GitRepos repo;
  GitRepoDetailsCard(this.repo, {Key key}) : super(key: key);

  @override
  State<GitRepoDetailsCard> createState() => _GitRepoDetailsCardState();
}

class _GitRepoDetailsCardState extends State<GitRepoDetailsCard> {
  @override
  Widget build(BuildContext context) {
    var temp = Color((Random().nextDouble() * 0xFFFFFF).toInt());
    return BlocProvider(
      create: (context) =>
          RepoCardBloc(), //..add(FetchRepoCommit(widget.repo)),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.withOpacity(.6)),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              key: Key(widget.repo.name),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: temp.withOpacity(0.6),
                child: Text(
                  widget.repo.watchersCount.toString(),
                  style: TextStyle(color: temp.withOpacity(1)),
                ),
              ),
              title: Text(widget.repo.name),
              subtitle: Text(
                widget.repo?.description ?? 'No Description found.',
                maxLines: 2,
              ),
            ),
            BlocBuilder<RepoCardBloc, RepoCardState>(builder: (context, state) {
              if (state is LoadingDetails)
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: LinearProgressIndicator(),
                );
              else if (state is ShowDetails)
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Last commit by ${state.data.first.commit.author.name}:"),
                    Text(" ${state.data.first.commit.message}"),
                  ],
                );

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Couldn't Load Last commit.")
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
