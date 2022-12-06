part of 'commit_list_bloc.dart';

@immutable
abstract class CommitListEvent {}

class fetchCommits extends CommitListEvent {}
