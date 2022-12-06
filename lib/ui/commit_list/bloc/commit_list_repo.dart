import 'package:git_commits/api/api_provider.dart';
import 'package:git_commits/models/git_repo_model.dart';

class CommitListRepo {
  ApiProvider _apiProvider = ApiProvider.getInstance();

  Future<List<GitRepos>> getGitRepos() async {
    try {
      var response = await _apiProvider.getGitRepos();
      if (response == null) {
        return null;
      }
      return gitReposFromJson(response.body);
    } catch (e) {
      return null;
    }
  }
}
