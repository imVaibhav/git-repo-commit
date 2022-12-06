part of 'commit_list_bloc.dart';

@immutable
abstract class CommitListState {}

class CommitListInitial extends CommitListState {}

class LoadingCommits extends CommitListState {}

class ShowCommits extends CommitListState {
  List<GitRepos> list;
  ShowCommits(this.list);
}

class Error extends CommitListState {}
